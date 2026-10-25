-- RTG 1.6: Profession Guide, two FULLY SEPARATE scroll parents.
-- Only the active tab's entire frame is visible. This prevents shopping
-- editboxes, icons and checkboxes from painting on top of crafting steps.
local RTG = RaidTacticsGuide
local UI = RTG.UI
local Shop = RTG.ProfessionShopping
local V = {}
RTG.views.professions = V

local function text(parent, txt, x, y, style, width)
    local f=parent:CreateFontString(nil,'OVERLAY')
    f:SetFontObject(style or UI.fonts.small)
    f:SetPoint('TOPLEFT',x,y)
    f:SetText(txt or '')
    f:SetJustifyH('LEFT')
    f:SetJustifyV('TOP')
    if width then f:SetWidth(width) end
    return f
end
local function input(parent,w,max)
    local e=CreateFrame('EditBox',UI.NewName('ProfInput'),parent,'InputBoxTemplate')
    e:SetWidth(w);e:SetHeight(22);e:SetAutoFocus(false);e:SetNumeric(true)
    e:SetMaxLetters(max or 6)
    return e
end
local function shorten(name,max)
    name=tostring(name or '')
    local aliases={['Bolt of Imbued Frostweave Cloth']='Imbued Frostweave Bolt',
        ['Bolt of Imbued Netherweave']='Imbued Netherweave Bolt',
        ['Crimson Silk Pantaloons']='Crimson Silk Pants'}
    name=aliases[name] or name
    if #name>max then return name:sub(1,max-3)..'...' end
    return name
end
-- Compact material abbreviations; source names remain available in the
-- central recipe tooltip for the player who needs the full wording.
local function compactMaterials(value)
    if not value then return 'Not verified' end
    local aliases={
        ['Greater Cosmic Essence']='Gr. Cosmic Essence',
        ['Greater Eternal Essence']='Gr. Eternal Essence',
        ['Greater Planar Essence']='Gr. Planar Essence',
        ['Lesser Planar Essence']='Ls. Planar Essence',
        ['Large Prismatic Shard']='Lg. Prismatic Shard',
        ['Large Brilliant Shard']='Lg. Brilliant Shard',
        ['Greater Magic Essence']='Gr. Magic Essence',
        ["Khadgar's Whisker"]='Khadgar Whisker',
        ['Minor Healing Potion']='Minor Heal Potion',
        ['Mountain Silversage']='Mt. Silversage',
    }
    for full,abbr in pairs(aliases) do
        value=value:gsub(full:gsub('([^%w])','%%%1'),abbr)
    end
    return value
end
local function professionIcon(p)
    if p and p.skillSpellID then
        local _,icon=RTG:SpellInfo(p.skillSpellID)
        if icon and icon~='' then return icon end
    end
    return (p and p.icon) or RTG.QUESTION_ICON
end
local function itemIcon(r)
    if GetItemIcon then
        if r.id then
            local v=GetItemIcon(r.id)
            if v then return v end
        end
        local v=GetItemIcon(r.name)
        if v then return v end
    end
    return RTG.QUESTION_ICON
end
local function showItemTip(button)
    local e=button.entry
    if not e then return end
    GameTooltip:SetOwner(button,'ANCHOR_RIGHT')
    local ok=false
    if e.id then ok=pcall(GameTooltip.SetHyperlink,GameTooltip,'item:'..e.id) end
    if not ok then GameTooltip:AddLine(e.name,1,.82,0) end
    if e.required then
        GameTooltip:AddLine('Need: '..e.required..'  |  Have: '..e.collected,1,1,1)
        GameTooltip:AddLine('Missing: '..math.max(0,e.required-e.collected),1,.5,.35)
    else
        GameTooltip:AddLine('Quantity not published in the Warmane guide',1,.65,.3)
    end
    GameTooltip:Show()
end

function V:Selected()
    local db=Shop:Storage()
    return RTG.ProfessionsByKey[db.selected] or RTG.Professions[1]
end
function V:Build(f,L)
    self.f,self.L=f,L
    self.leftScroll=UI.CreateScrollArea(f.left,L.leftW-30)
    self.leftScroll:SetPoint('TOPLEFT',4,-f.listTop)
    self.leftScroll:SetPoint('BOTTOMRIGHT',-26,6)
    self.centerScroll=UI.CreateScrollArea(f.center,L.centerW-30)
    self.centerScroll:SetPoint('TOPLEFT',4,-f.centerTop)
    self.centerScroll:SetPoint('BOTTOMRIGHT',-26,6)
    self.profRows={}
    for i,p in ipairs(RTG.Professions) do
        local button=UI.CreateListButton(self.leftScroll.child,L.leftW-30,32)
        button:SetPoint('TOPLEFT',0,-(i-1)*34)
        button:SetIconTexture(professionIcon(p),p.icon,RTG.QUESTION_ICON)
        button:SetData(p.name)
        button.profKey=p.key
        button:SetScript('OnClick',function(self)
            Shop:Storage().selected=self.profKey
            V:Refresh()
        end)
        self.profRows[i]=button
    end
    self.leftScroll.child:SetHeight(math.max(1,#self.profRows*34))
    self.stepRows={}

    self.page=CreateFrame('Frame',nil,f.content)
    self.page:SetAllPoints()
    local hdrIcon=self.page:CreateTexture(nil,'ARTWORK')
    hdrIcon:SetWidth(21);hdrIcon:SetHeight(21)
    hdrIcon:SetPoint('TOPLEFT',12,-8)
    hdrIcon:SetTexCoord(.07,.93,.07,.93)
    self.headerIcon=hdrIcon
    self.header=text(self.page,'',39,-10,UI.fonts.heading,L.contentW-56)
    self.source=text(self.page,'',12,-37,UI.fonts.tiny,L.contentW-30)
    self.source:SetHeight(13)
    if self.source.SetWordWrap then self.source:SetWordWrap(false) end

    self.guideTab=UI.CreateTab(self.page,'Leveling Guide',124,25)
    self.guideTab:SetPoint('TOPLEFT',12,-60)
    self.guideTab:SetScript('OnClick',function()
        Shop:Storage().tab='guide';V:Refresh()
    end)
    self.shopTab=UI.CreateTab(self.page,'Shopping List',124,25)
    self.shopTab:SetPoint('LEFT',self.guideTab,'RIGHT',5,0)
    self.shopTab:SetScript('OnClick',function()
        Shop:Storage().tab='shopping';V:Refresh()
    end)
    self.stoneButton=UI.CreateButton(self.page,'Stone: choose',150,25)
    self.stoneButton:SetPoint('LEFT',self.shopTab,'RIGHT',5,0)
    self.stoneButton:SetScript('OnClick',function()
        local stones=V:Selected().stones
        if not stones then return end
        local db=Shop:Storage()
        local nextIndex=1
        for i,stone in ipairs(stones) do
            if stone.key==db.alchemyStone then nextIndex=i % #stones+1;break end
        end
        db.alchemyStone=stones[nextIndex].key
        V:Refresh()
    end)
    self.sourceTip=CreateFrame('Button',nil,self.page)
    self.sourceTip:SetAllPoints(self.source)
    self.sourceTip:SetScript('OnEnter',function(button)
        local p=V:Selected()
        GameTooltip:SetOwner(button,'ANCHOR_RIGHT')
        GameTooltip:AddLine(p.name,1,.82,0)
        GameTooltip:AddLine(p.source or '',.8,.8,.7,true)
        GameTooltip:AddLine(p.note or '',1,1,1,true)
        GameTooltip:Show()
    end)
    self.sourceTip:SetScript('OnLeave',UI.HideTooltip)
    text(self.page,'From',12,-103,UI.fonts.small)
    self.lowInput=input(self.page,54,3)
    self.lowInput:SetPoint('TOPLEFT',49,-97)
    text(self.page,'To',115,-103,UI.fonts.small)
    self.highInput=input(self.page,54,3)
    self.highInput:SetPoint('TOPLEFT',134,-97)
    local apply=UI.CreateButton(self.page,'Apply Range',112,22)
    apply:SetPoint('TOPLEFT',197,-98)
    local full=UI.CreateButton(self.page,'Full 1-450',104,22)
    full:SetPoint('TOPLEFT',316,-98)
    local function applyRange()
        local p=V:Selected()
        if not p then return end
        Shop:SetRange(p.key,V.lowInput:GetText(),V.highInput:GetText())
        V.lowInput:ClearFocus();V.highInput:ClearFocus()
        V:Refresh()
    end
    apply:SetScript('OnClick',applyRange)
    self.lowInput:SetScript('OnEnterPressed',applyRange)
    self.highInput:SetScript('OnEnterPressed',applyRange)
    full:SetScript('OnClick',function()
        local p=V:Selected()
        if p then Shop:SetRange(p.key,1,450);V:Refresh() end
    end)

    -- Fully isolated Leveling Guide panel, with its OWN scrollframe and rows.
    self.guidePanel=CreateFrame('Frame',nil,self.page)
    self.guidePanel:SetPoint('TOPLEFT',8,-131)
    self.guidePanel:SetPoint('BOTTOMRIGHT',-10,7)
    self.guideScroll=UI.CreateScrollArea(self.guidePanel,L.contentW-54)
    self.guideScroll:SetPoint('TOPLEFT',4,-2)
    self.guideScroll:SetPoint('BOTTOMRIGHT',-21,2)
    self.guideRows={}

    -- Shopping List never shares a scroll child or row with Leveling Guide.
    self.shopPanel=CreateFrame('Frame',nil,self.page)
    self.shopPanel:SetPoint('TOPLEFT',8,-132)
    self.shopPanel:SetPoint('BOTTOMRIGHT',-10,7)
    self.progressText=text(self.shopPanel,'',4,-2,UI.fonts.small,L.contentW-43)
    self.progressText:SetHeight(29)
    self.progressBar=CreateFrame('StatusBar',nil,self.shopPanel)
    self.progressBar:SetPoint('TOPLEFT',4,-33)
    self.progressBar:SetWidth(L.contentW-51)
    self.progressBar:SetHeight(9)
    self.progressBar:SetMinMaxValues(0,100)
    self.progressBar:SetStatusBarTexture('Interface\\TargetingFrame\\UI-StatusBar')
    self.progressBar:SetStatusBarColor(.84,.65,.19)
    self.shopScroll=UI.CreateScrollArea(self.shopPanel,L.contentW-54)
    self.shopScroll:SetPoint('TOPLEFT',4,-49)
    self.shopScroll:SetPoint('BOTTOMRIGHT',-21,2)
    self.materialRows={}
    self.shopInfoRows={}
    self:HideView()
end
function V:ShowView()
    self.f.leftCaption:SetText('PROFESSIONS')
    self.leftScroll:Show();self.centerScroll:Show();self.page:Show()
    self:Refresh()
end
function V:HideView()
    if self.leftScroll then self.leftScroll:Hide() end
    if self.centerScroll then self.centerScroll:Hide() end
    if self.page then self.page:Hide() end
end
function V:DrawSteps(p,lo,hi)
    local n=0
    if p.kind~='unavailable' then
        for _,s in ipairs(p.recipeRows or {}) do
            if s.high>lo and s.low<hi then
                n=n+1
                local row=self.stepRows[n]
                if not row then
                    row=UI.CreateListButton(self.centerScroll.child,self.L.centerW-30,44)
                    row:SetScript('OnClick',function(self)
                        if self.step and self.step.targetKnown then
                            Shop:SetRange(Shop:Storage().selected,self.step.low,self.step.high)
                            V:Refresh()
                        end
                    end)
                    row:SetScript('OnEnter',function(self)
                        if not self.step then return end
                        GameTooltip:SetOwner(self,'ANCHOR_RIGHT')
                        GameTooltip:AddLine(self.step.name,1,.82,0)
                        GameTooltip:AddLine('Craft x'..tostring(self.step.count or '?'),1,1,1)
                        GameTooltip:AddLine('Mats: '..(self.step.mats or 'Unknown'),.8,.8,.7,true)
                        GameTooltip:Show()
                    end)
                    row:SetScript('OnLeave',UI.HideTooltip)
                    self.stepRows[n]=row
                end
                row.step={low=s.low,high=s.high,targetKnown=p.hasSkillBrackets~=false,
                    count=s.count,name=s.name,mats=s.mats}
                row:ClearAllPoints();row:SetPoint('TOPLEFT',0,-(n-1)*46)
                row:SetIconTexture(professionIcon(p),p.icon,RTG.QUESTION_ICON)
                row:SetData(p.hasSkillBrackets==false and 'Recipe' or ('To '..s.high),shorten(s.name,19))
                row:SetSelected(false);row:Show()
            end
        end
    end
    for i=n+1,#self.stepRows do self.stepRows[i]:Hide() end
    self.centerScroll.child:SetHeight(math.max(1,n*46))
end
function V:GetGuideRow(i)
    local r=self.guideRows[i]
    if not r then
        r=CreateFrame('Frame',nil,self.guideScroll.child)
        r:SetWidth(self.guideScroll.contentWidth)
        r:SetHeight(65)
        r.title=text(r,'',4,-3,UI.fonts.sub,self.guideScroll.contentWidth-15)
        r.title:SetHeight(17)
        r.mats=text(r,'',4,-24,UI.fonts.small,self.guideScroll.contentWidth-15)
        r.mats:SetHeight(38)
        self.guideRows[i]=r
    end
    r:Show();return r
end
function V:DrawGuide(p,lo,hi)
    local i,y=0,0
    if p.kind~='unavailable' then
        for _,s in ipairs(p.recipeRows or {}) do
            if s.high>lo and s.low<hi then
                i=i+1
                local r=self:GetGuideRow(i)
                r:ClearAllPoints();r:SetPoint('TOPLEFT',2,-y)
                local suffix=p.hasSkillBrackets==false and '  -> skill n/a' or ('  -> '..s.high)
                r.title:SetText(shorten(s.name,47)..'  x'..tostring(s.count or '?')..suffix)
                r.mats:SetText('Mats: '..compactMaterials(s.mats))
                local height=math.max(38,r.mats:GetStringHeight()+2)
                r.mats:SetHeight(height)
                r:SetHeight(27+height)
                y=y+29+height
            end
        end
    end
    if i==0 then
        local r=self:GetGuideRow(1)
        r:ClearAllPoints();r:SetPoint('TOPLEFT',2,0)
        r.title:SetText(p.kind=='unavailable' and 'Leatherworking guide unavailable' or 'No guide steps for selected range')
        r.mats:SetText(p.kind=='unavailable' and 'No Warmane Forum 3x guide was provided.' or 'Try Full 1-450.')
        i=1;y=75
    end
    for n=i+1,#self.guideRows do self.guideRows[n]:Hide() end
    self.guideScroll.child:SetHeight(math.max(1,y))
end
function V:GetMaterialRow(i)
    local r=self.materialRows[i]
    if not r then
        r=CreateFrame('Frame',nil,self.shopScroll.child)
        r:SetWidth(self.shopScroll.contentWidth);r:SetHeight(37)
        local icon=CreateFrame('Button',nil,r)
        icon:SetWidth(27);icon:SetHeight(27);icon:SetPoint('TOPLEFT',2,-3)
        icon.tex=icon:CreateTexture(nil,'ARTWORK');icon.tex:SetAllPoints()
        icon.tex:SetTexCoord(.07,.93,.07,.93)
        icon:SetScript('OnEnter',showItemTip)
        icon:SetScript('OnLeave',UI.HideTooltip)
        r.icon=icon
        r.name=text(r,'',34,-6,UI.fonts.small,175)
        r.need=text(r,'',212,-6,UI.fonts.small,54)
        r.value=input(r,47,6);r.value:SetPoint('TOPLEFT',277,-1)
        r.check=CreateFrame('CheckButton',UI.NewName('ShopCheck'),r,'UICheckButtonTemplate')
        r.check:SetPoint('TOPLEFT',335,-1)
        r.missing=text(r,'',381,-6,UI.fonts.small,52)
        r.value:SetScript('OnEnterPressed',function(box)box:ClearFocus()end)
        r.value:SetScript('OnEditFocusLost',function(box)
            if not r.entry then return end
            local amount=math.max(0,math.min(999999,math.floor(tonumber(box:GetText()) or 0)))
            if amount~=Shop:GetCollected(r.profKey,r.entry.name) then
                Shop:SetCollected(r.profKey,r.entry.name,amount)
                V:Refresh()
            end
        end)
        r.check:SetScript('OnClick',function(check)
            if not r.entry or not r.entry.required then return end
            Shop:SetCollected(r.profKey,r.entry.name,check:GetChecked() and r.entry.required or 0)
            V:Refresh()
        end)
        self.materialRows[i]=r
    end
    r:Show();return r
end
function V:GetShopInfoRow(i)
    local r=self.shopInfoRows[i]
    if not r then
        r=CreateFrame('Frame',nil,self.shopScroll.child)
        r:SetWidth(self.shopScroll.contentWidth);r:SetHeight(38)
        r.line=text(r,'',4,-3,UI.fonts.small,self.shopScroll.contentWidth-15)
        r.line:SetHeight(34)
        self.shopInfoRows[i]=r
    end
    r:Show();return r
end
function V:DrawShopping(p,lo,hi)
    local items,full,segments,info=Shop:BuildList(p,lo,hi)
    local have,need,percent=Shop:Progress(items)
    if p.kind=='unavailable' then
        self.progressText:SetText('No Leatherworking material guide available.')
    elseif need>0 then
        self.progressText:SetText(have..'/'..need..' collected ('..percent..'%)'..
            (full and '' or '  |  PARTIAL / ESTIMATE'))
    else
        self.progressText:SetText('No published material totals for this range.')
    end
    if percent then self.progressBar:SetValue(percent);self.progressBar:Show()
    else self.progressBar:Hide() end

    local n,inf,y=0,0,0
    local function message(value)
        inf=inf+1
        local h=self:GetShopInfoRow(inf)
        h:ClearAllPoints();h:SetPoint('TOPLEFT',2,-y)
        h.line:SetText(value)
        local height=math.max(34,h.line:GetStringHeight()+2)
        h.line:SetHeight(height);h:SetHeight(height+4)
        y=y+height+8
    end
    if info.standard then message('Published standard-rate quantities; not scaled to 3x.') end
    if info.wider then
        local brackets={}
        for _,segment in ipairs(segments) do brackets[#brackets+1]=segment[1]..'-'..segment[2] end
        message('Published bracket totals: '..table.concat(brackets,', ')..'. Amounts cover these full brackets.')
    end
    if info.chooseStone then message('Choose an Alchemist Stone above to include its materials.') end
    if info.stone then message('Includes the '..info.stone..' Alchemist Stone.') end
    if p.note and p.note~='' then message(p.note) end
    if info.missing and p.kind~='unavailable' then message('The guide has no material totals for part of this range.') end
    if #items>0 then message('Material                         Need       Have      Done     Missing') end
    for _,entry in ipairs(items) do
        n=n+1
        local r=self:GetMaterialRow(n)
        r.entry=entry;r.profKey=p.key;r.icon.entry=entry
        r:ClearAllPoints();r:SetPoint('TOPLEFT',2,-y)
        r.name:SetText(shorten(entry.name,27))
        r.need:SetText(entry.required and tostring(entry.required) or '?')
        r.value:SetText(tostring(entry.collected))
        if entry.required then
            r.check:Enable()
            r.check:SetChecked(entry.collected>=entry.required)
            local missing=math.max(0,entry.required-entry.collected)
            r.missing:SetText(tostring(missing))
            if missing==0 then r.missing:SetTextColor(.4,.9,.4)
            else r.missing:SetTextColor(1,.4,.3) end
        else
            r.check:SetChecked(false);r.check:Disable()
            r.missing:SetText('?');r.missing:SetTextColor(1,.65,.3)
        end
        RTG:SetTextureSafe(r.icon.tex,itemIcon(entry),RTG.QUESTION_ICON)
        y=y+38
    end
    for j=n+1,#self.materialRows do self.materialRows[j]:Hide() end
    for j=inf+1,#self.shopInfoRows do self.shopInfoRows[j]:Hide() end
    self.shopScroll.child:SetHeight(math.max(1,y))
end
function V:Refresh()
    if not self.page then return end
    local db=Shop:Storage()
    local p=self:Selected()
    if not p then return end
    for i,x in ipairs(RTG.Professions) do
        self.profRows[i]:SetSelected(x.key==p.key)
        self.profRows[i]:SetIconTexture(professionIcon(x),x.icon,RTG.QUESTION_ICON)
    end
    local low,high=Shop:GetRange(p.key)
    self.lowInput:SetText(tostring(low));self.highInput:SetText(tostring(high))
    self.header:SetText(p.name:upper())
    self.stoneButton:Hide()
    if p.stones then
        local label='choose'
        for _,stone in ipairs(p.stones) do
            if stone.key==db.alchemyStone then label=stone.label end
        end
        self.stoneButton:SetText('Stone: '..label)
        self.stoneButton:Show()
    end
    RTG:SetTextureSafe(self.headerIcon,professionIcon(p),p.icon,RTG.QUESTION_ICON)
    local sourceLabel='WARMANE FORUM GUIDE'
    if p.key=='alchemy' or p.key=='firstaid' then sourceLabel='WARMANE FORUM 3X GUIDE'
    elseif p.key=='cooking' then sourceLabel='WARMANE ALLIANCE 1-400 (PARTIAL)'
    elseif p.key=='enchanting' then sourceLabel='WARMANE GUIDE - NOT 3X-SPECIFIC'
    elseif p.kind=='unavailable' then sourceLabel='GUIDE UNAVAILABLE'
    elseif p.key=='tailoring' or p.key=='blacksmithing' or p.key=='engineering' or p.key=='jewelcrafting' then
        sourceLabel='WARMANE FORUM 3X GUIDE' end
    -- Fixed-width, single-line source label; NEVER long notes outside page.
    self.source:SetText(sourceLabel)
    self.guideTab:SetSelected(db.tab=='guide')
    self.shopTab:SetSelected(db.tab=='shopping')
    self.f.centerCaption:SetText(db.tab=='guide' and 'CRAFTING STEPS' or 'SKILL TARGETS')
    -- Hide the inactive PARENT first, including every nested icon/editbox.
    if db.tab=='shopping' then
        self.guidePanel:Hide()
        self.shopPanel:Show()
        self:DrawShopping(p,low,high)
    else
        self.shopPanel:Hide()
        self.guidePanel:Show()
        self:DrawGuide(p,low,high)
    end
    self:DrawSteps(p,low,high)
end
function V:Breadcrumb()
    local p=self:Selected()
    return 'Professions / '..(p and p.name or '')
end
function V:CanGoBack() return false end
