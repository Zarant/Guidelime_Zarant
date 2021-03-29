local name,addon = ...

Guidelime.Zarant = {}

if not addon.parseLine and Guidelime.addon then
	addon = Guidelime.addon
end

Guidelime.Zarant.Modules = {}

local z = Guidelime.Zarant

--local j = 0
function z.getQuestItemList()
	local itemList = {}
	for bag = BACKPACK_CONTAINER, NUM_BAG_FRAMES do
		for slot = 1,GetContainerNumSlots(bag) do
			local id = GetContainerItemID(bag, slot)
			local spell = GetItemSpell(id)
			if id and spell then
				local itemName, _, _, _, _, _, _, _,_, itemTexture, _, classID = GetItemInfo(id)
				if classID == 12 then
					--j = j+1
					itemList[id] = {name = itemName, texture = itemTexture, bag = bag, slot = slot}
				end
			end
		end
	end
	return itemList
end


function z.CreateItemFrame()
if zQuestItemFrame then return end
--[[
local x = GuidelimeZarantData.fx or 0
local y = GuidelimeZarantData.fy or 0
local point = GuidelimeZarantData.point or "BOTTOMRIGHT"
local relativePoint = GuidelimeZarantData.relativePoint or "BOTTOMRIGHT"
]]
local x =  0
local y =  -50
local point = "BOTTOMLEFT"
local relativePoint =  "BOTTOMLEFT"

zQuestItemFrame = CreateFrame("Frame","zQuestItemFrame",addon.mainFrame)

local f = zQuestItemFrame
local backdrop = {bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
	tile = true, tileSize = 16, 
	--edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
	--edgeSize = 16, insets = {left = 4, right = 4, top = 4, bottom = 4}
}
f:SetPoint(point,addon.mainFrame,relativePoint, x, y)
f:SetBackdrop(backdrop);
f:SetBackdropColor(0,0,0,0);

--f:SetClampedToScreen(true)
--f:EnableMouse(true)
--f:SetMovable(true)

--[[
f:SetScript("OnMouseDown", function(self, button)
	if IsAltKeyDown() then
		f:StartSizing("BOTTOMRIGHT")
	else
		f:StartMoving()
	end
	
end)
f:SetScript("OnMouseUp", function(self,button)
	f:StopMovingOrSizing()
	local point, relativeTo, relativePoint, x, y = self:GetPoint()
	GuidelimeZarantData.fx = x
	GuidelimeZarantData.fy = y
	GuidelimeZarantData.point = point
	GuidelimeZarantData.relativePoint = relativePoint
	z.UpdateFrame()
end)]]

f:RegisterEvent("BAG_UPDATE")
f:SetScript("OnEvent",function()
	if not InCombatLockdown() then
		z.UpdateFrame()
	end
end)

f = zQuestItemFrame
f.TextFrame = f.TextFrame or CreateFrame("Frame", "$parentTextFrame", f)
f.TextFrame:SetPoint("RIGHT", f,"LEFT")
f.TextFrame:SetWidth(70)
f.TextFrame:SetHeight(14)
f.TextFrame.text = f.TextFrame.text or f.TextFrame:CreateFontString(nil,"OVERLAY") 
f.TextFrame.text:SetFontObject(GameFontNormal)
f.TextFrame.text:SetPoint("TOPLEFT",7,-5)
f.TextFrame.text:SetJustifyH("RIGHT")
f.TextFrame.text:SetJustifyV("TOP")
f.TextFrame:SetPoint("TOPLEFT",0,0)
f.TextFrame.text:SetText("Quest Items")
zQuestItemFrame:SetHeight(50);

z.UpdateFrame()

end

local buttonList = {}

local fOnEnter = function(self)
	--print(self.itemId)
	if self.itemId then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetInventoryItemByID(self.itemId)
		GameTooltip:Show()
	end
end

local fOnLeave = function(self)
	GameTooltip:Hide()
	if IsMouseButtonDown() and not InCombatLockdown() then
		PickupContainerItem(self.bag,self.slot)
	end
end

function z.UpdateFrame()
	if addon.currentGuide and addon.currentGuide.group ~= "Zarant" then
		return zQuestItemFrame:Hide()
	end
	
	local itemList = z.getQuestItemList()

--/run Guidelime.Zarant.CreateItemFrame()
	local i = 0
	for id,item in pairs(itemList) do
		i = i+1
		local btn = buttonList[i]
		
		if not btn then
			btn = CreateFrame("CheckButton", "Example", zQuestItemFrame, "SecureActionButtonTemplate")
			btn:SetAttribute("type", "item")
			btn:SetSize(25, 25)
			table.insert(buttonList,btn)
			local n = #buttonList

			btn:ClearAllPoints()
			if n == 1 then
				btn:SetPoint("BOTTOMLEFT", zQuestItemFrame,"BOTTOMLEFT", 5,5)
			else
				btn:SetPoint("CENTER",buttonList[n-1],"CENTER",27,0)
			end
			btn.icon  = btn:CreateTexture(nil, "BACKGROUND");
			local icon = btn.icon
			icon:SetAllPoints(true);
			icon:SetTexture("Interface/Buttons/Button-Backpack-Up");
			
			
			
			btn:SetScript("OnEnter",fOnEnter)
			btn:SetScript("OnLeave",fOnLeave)

			local ht = btn:CreateTexture(nil, "HIGHLIGHT")
			ht:SetAllPoints(true)
			ht:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
			ht:SetBlendMode("ADD")
		end
		
		--print(id,item.texture,item.name)
		btn:SetAttribute("item", item.name)
		btn.itemId = id
		btn.bag = item.bag
		btn.slot = item.slot
		btn.icon:SetTexture(item.texture)
		btn:Show()
	end
	if i == 0 then
		zQuestItemFrame:Hide()
	else
		zQuestItemFrame:Show()
	end

	for n = i+1,#buttonList do
		buttonList[n]:Hide()
	end

local width = math.max(90,i*27+7)
zQuestItemFrame:SetWidth(width);


end
--"PLAYER_REGEN_ENABLED"












local QUEST_GREETING_OLD = addon.frame.QUEST_GREETING
local npcList = {467,349,1379,7766,1978,7784,2713,2768,2610,2917,7806,3439,3465,3568,3584,4484,3692,4508,4880,4983,5391,5644,5955,7780,7807,7774,7850,8284,8380,8516,9020,9520,9623,9598,9023,9999,10427,10300,10646,10638,11016,11218,11711,11625,11626,1842,12277,12580,12818,11856,12858,12717,13716}

--Prevents auto accept script from accepting escort quests (needs testing)
function addon.frame.QUEST_GREETING(...)
local autoComplete = GuidelimeZarantData.autoCompleteQuest
	
	local id = Guidelime.Zarant.NpcId()
	for _,v in ipairs(npcList) do
		if id == v then
			GuidelimeZarantData.autoCompleteQuest = false
		end
	end
	QUEST_GREETING_OLD(...)
	GuidelimeZarantData.autoCompleteQuest = autoComplete
end

local ParseCustomLuaCode = function() return end
local loadCurrentGuideOLD = addon.loadCurrentGuide
function addon.loadCurrentGuide(...)
	local r = loadCurrentGuideOLD(...)
	ParseCustomLuaCode()
	if Guidelime.Zarant.Modules.OnLoad then z.UpdateFrame() end
	return r
end


if addon.parseCustomLuaCode or Guidelime.Zarant.RegisterStep then
	return
end



local parseLineOLD = addon.parseLine

local updateStepsOLD = addon.updateSteps
local function RegisterStep(self,eventList,eval,args,frameCounter,guide,step)
	
	if frameCounter > #addon.customCodeData+1  then
		return
	end
	if #addon.customCodeData < frameCounter then
		table.insert(addon.customCodeData,CreateFrame("Frame"))
	end
	
	if type(self[eval]) ~= "function" then
		return 
	end
	
	local frame = addon.customCodeData[frameCounter]
	frame.data = {}
	frame.data.guide = guide
	frame.data.step = step
	frame.args = args
	
	setmetatable(frame.data, self)
	
	local function EventHandler(s,...) --Executes the function if step is active or if it's specified on a 0 element step (e.g. guide name)
		if s.data.step.active or #s.data.step.elements == 0 or s.data.persistent then 
			self[eval](s.data,args,...)
		end
	end
	local OnUpdate
	for _,eventRaw in pairs(eventList) do
		local event = {}
		eventRaw:gsub("[^:]+",function(e)
			table.insert(event,e)
		end)

		if event[1] == "OnUpdate" then
			OnUpdate = true
			frame:SetScript("OnUpdate",EventHandler)
		elseif event[1] == "OnLoad" then
			self[eval](frame.data,args,"OnLoad")
		elseif event[1] == "OnStepActivation" then
			frame.OnStepActivation = self[eval]
		elseif event[1] == "OnStepCompletion" then
			frame.OnStepCompletion = self[eval]
		elseif event[1] == "OnStepUpdate" then
			frame.OnStepUpdate = self[eval]
		else
			if #event == 1 then
				if not pcall(frame.RegisterEvent,frame,event[1]) then
					print("Error loading guide: Ignoring invalid event name at line "..step.line..": "..event[1])
				end
			else
				if not pcall(frame.RegisterUnitEvent,frame,unpack(event)) then
					print("Error loading guide: Ignoring invalid event name at line "..step.line)
				end
			end
		end
	end
	if not OnUpdate then
		addon.customCodeData[frameCounter]:SetScript("OnEvent",EventHandler)
	end
end

function addon.WipcustomCodeDataData()
	if not addon.customCodeData then
		addon.customCodeData = {}
	end
	for _,frame in pairs(addon.customCodeData) do
		frame:SetScript("OnUpdate", nil)
		frame:SetScript("OnEvent", nil)
		frame:UnregisterAllEvents()
		frame.OnStepActivation = nil
		frame.OnStepCompletion = nil
		frame.OnStepUpdate = nil
		frame.args = nil
		if frame.data then
			frame.data.persistent = nil
			frame.data.timer = nil
		end
		frame.data = nil
	end
end


function addon.parseLine(...)
	local step = ...
	if step.text and not string.match(step.text,"%-%-.*%-%-") then
		step.event, step.eval = string.match(step.text,"%-%-(.*)>>(.*)")
	end
	return parseLineOLD(...)
end

function ParseCustomLuaCode()
	addon.WipcustomCodeDataData()
	local guide = addon.guides[GuidelimeDataChar.currentGuide]
	if not (guide and guide.group) then return end
	local groupTable = Guidelime[guide.group]
	if not groupTable then Guidelime[guide.group] = true end
	
	if type(groupTable) == "table" then
		local frameCounter = 0
		groupTable.__index = groupTable
		
		for stepLine, step in ipairs(guide.steps) do
			if addon.applies(step) then 
				if step.eval and step.event then
					frameCounter = frameCounter + 1
					local args = {}
					local eval = nil
					for arg in step.eval:gmatch('[^,]+') do
						if not eval then
							eval = arg:gsub("%s","")
						else
							local c = string.match(arg,"^%s*(.*%S+)%s*$")
							if c then table.insert(args,c) end
						end
					end
					step.event = step.event:gsub("%s","")
					if step.event == "" then 
						step.event = groupTable[eval]() or "OnStepActivation"
					end
					local eventList = {}
					for event in step.event:gmatch('[^,]+') do
						table.insert(eventList,event)
					end
					RegisterStep(groupTable,eventList,eval,args,frameCounter,guide,step)
				end
			end
		end
	end

end





function addon.updateSteps(...)

	local customCodeData = addon.customCodeData
	local isStepActive = {}
	if customCodeData then
		for i,v in ipairs(customCodeData) do
			if v.data and v.data.step then
				isStepActive[i] = v.data.step.active
				if v.OnStepUpdate then
					v.OnStepUpdate(v.data,v.args,"OnStepUpdate")
				end
			end
		end
	end

	local r = updateStepsOLD(...)
	
	if customCodeData then
		for i,v in ipairs(customCodeData) do
			if v.data and v.data.step then
				local step = v.data.step
				if v.OnStepActivation and step.active and not isStepActive[i] then
					--print(step.index)
					v.OnStepActivation(v.data,v.args,"OnStepActivation")
				elseif v.OnStepCompletion and isStepActive[i] == not step.active and (step.completed or step.skip) then
					v.OnStepCompletion(v.data,v.args,"OnStepCompletion")
				end
			end
		end
	end
	
	return r
end


--[[local updateArrow = addon.updateArrow
function addon.updateArrow()
	if C_QuestLog.IsOnQuest(3912) then --Meet at the grave
		local mapID = MapUtil.GetDisplayableMapForPlayer();
		if mapID == 1446 then
			local player_pos = C_Map.GetPlayerMapPosition(mapID,"player");
			if player_pos then
				local x,y = player_pos:GetXY();
				if (x-0.538)^2 + (y-0.29)^2 < 0.0037 then --checks if the player is near the tanaris GY
					addon.alive = true
				else
					addon.alive = HBD:GetPlayerZone() == nil or C_DeathInfo.GetCorpseMapPosition(HBD:GetPlayerZone()) == nil
				end
			end
		end
	end
	return updateArrow()
end]]
