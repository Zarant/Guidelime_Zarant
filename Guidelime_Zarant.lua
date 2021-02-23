local name,addon = ...

Guidelime.Zarant = {}


Guidelime.Zarant.Modules = {}

local z = Guidelime.Zarant


local QUEST_GREETING_OLD = addon.frame.QUEST_GREETING
local npcList = {467,349,1379,7766,1978,7784,2713,2768,2610,2917,7806,3439,3465,3568,3584,4484,3692,4508,4880,4983,5391,5644,5955,7780,7807,7774,7850,8284,8380,8516,9020,9520,9623,9598,9023,9999,10427,10300,10646,10638,11016,11218,11711,11625,11626,1842,12277,12580,12818,11856,12858,12717,13716}

--Prevents auto accept script from accepting escort quests (needs testing)
function addon.frame.QUEST_GREETING(...)
local autoComplete = GuidelimeData.autoCompleteQuest
	
	local id = Guidelime.Zarant.NpcId()
	for _,v in ipairs(npcList) do
		if id == v then
			GuidelimeData.autoCompleteQuest = false
		end
	end
	QUEST_GREETING_OLD(...)
	GuidelimeData.autoCompleteQuest = autoComplete
end

if not addon.parseLine and Guidelime.addon then
	addon = Guidelime.addon
end
Guidelime.Zarant.addonTable = addon

if addon.parseCustomLuaCode or Guidelime.Zarant.RegisterStep then
	return
end




local parseLineOLD = addon.parseLine
local loadCurrentGuideOLD = addon.loadCurrentGuide
local updateStepsOLD = addon.updateSteps
local function RegisterStep(self,eventList,eval,args,frameCounter,guide,step)
	
	if frameCounter > #addon.customCodeData+1  then
		return
	end
	if #addon.customCodeData < frameCounter then
		table.insert(addon.customCodeData,CreatcustomCodeData("Frame"))
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
	for _,event in pairs(eventList) do
		--print(eval,event)
		if event == "OnUpdate" then
			OnUpdate = true
			frame:SetScript("OnUpdate",EventHandler)
		elseif event == "OnLoad" then
			self[eval](frame.data,args,"OnLoad")
		elseif event == "OnStepActivation" then
			frame.OnStepActivation = self[eval]
		elseif event == "OnStepCompletion" then
			frame.OnStepCompletion = self[eval]
		elseif event == "OnStepUpdate" then
			frame.OnStepUpdate = self[eval]
		else
			if not pcall(frame.RegisterEvent,frame,event) then
				print("Error loading guide: Ignoring invalid event name at line"..step.line..": "..event)
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

local function ParseCustomLuaCode()
	local guide = addon.guides[GuidelimeDataChar.currentGuide]
	local groupTable = Guidelime[guide.group]
	if not groupTable then Guidelime[guide.group] = true end
	addon.WipcustomCodeDataData()
	
	if guide and type(groupTable) == "table" then
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
							eval = arg:gsub("%s*","")
						else
							local c = string.match(arg,"^%s*(.*%S+)%s*$")
							if c then table.insert(args,c) end
						end
					end
					step.event = step.event:gsub("%s*","")
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


function addon.loadCurrentGuide(...)
	local r = loadCurrentGuideOLD(...)
	ParseCustomLuaCode()
	return r
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
