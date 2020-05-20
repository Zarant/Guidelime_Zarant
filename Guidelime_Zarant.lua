local name,addon = ...

if Guidelime_Zarant then
	return 
end

Guidelime_Zarant = {}
Guidelime_Zarant.__index = Guidelime_Zarant
Guidelime_Zarant.Modules = {}

local z = Guidelime_Zarant
local parseLineOLD = addon.parseLine
local loadCurrentGuideOLD = addon.loadCurrentGuide
local updateStepsOLD = addon.updateSteps

function Guidelime_Zarant:RegisterStep(eventList,eval,args,stepNumber,stepLine,frameCounter)
	
	if frameCounter > #self.eventFrame+1 or type(self[eval]) ~= "function" then
		return
	end
	if #self.eventFrame < frameCounter then
		table.insert(self.eventFrame,CreateFrame("Frame"))
	end
	
	local frame = self.eventFrame[frameCounter]
	frame.data = {}
	frame.data.stepLine = stepLine
	frame.data.stepNumber = stepNumber
	frame.data.guide = addon.guides[GuidelimeDataChar.currentGuide]
	frame.data.step = frame.data.guide.steps[stepLine]
	frame.args = args
	setmetatable(frame.data, self)
	


	local function EventHandler(s,...) --Executes the function if step is active or if it's specified on a 0 element step (e.g. guide name)
		if s.data.step.active or #s.data.step.elements == 0 then 
			self[eval](s.data,args,...)
		end
	end
	local OnUpdate
	for _,event in pairs(eventList) do

		if event == "OnUpdate" then
			OnUpdate = true
			frame:SetScript("OnUpdate",EventHandler)
		elseif event == "OnLoad" then
			self[eval](frame.data,args,"OnLoad")
		elseif event == "OnStepActivation" then
			frame.OnStepActivation = self[eval]
		elseif event == "OnStepCompletion" then
			frame.OnStepCompletion = self[eval]
		else
			if not pcall(frame.RegisterEvent,frame,event) then
				print("Error loading guide: Ignoring invalid event name at line"..stepLine..": "..event)
			end
			--print(frame:IsEventRegistered(event))
		end
	end
	if not OnUpdate then
		self.eventFrame[frameCounter]:SetScript("OnEvent",EventHandler)
	end
end

function Guidelime_Zarant:WipeData()
	if not self.eventFrame then
		self.eventFrame = {}
	end
	for _,frame in pairs(self.eventFrame) do
		frame:SetScript("OnUpdate", nil)
		frame:SetScript("OnEvent", nil)
		frame:UnregisterAllEvents()
		frame.OnStepActivation = nil
		frame.OnStepCompletion = nil
		frame.args = nil
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

function addon.loadCurrentGuide(...)

	

	local guide = addon.guides[GuidelimeDataChar.currentGuide]
	local r = loadCurrentGuideOLD(...)
	if guide == nil then
		return r
	end
	Guidelime_Zarant:WipeData()
	
	local frameCounter = 0
	
	local stepNumber = 0
	for stepLine, step in ipairs(guide.steps) do
		local filteredElements = {}
		local loadLine = addon.applies(step)
		for _, element in ipairs(step.elements) do
			if not element.generated and
				((element.text ~= nil and element.text ~= "") or 
				(element.t ~= "TEXT" and element.t ~= "NAME" and element.t ~= "NEXT" and element.t ~= "DETAILS" and element.t ~= "GUIDE_APPLIES" and element.t ~= "APPLIES" and element.t ~= "DOWNLOAD" and element.t ~= "AUTO_ADD_COORDINATES_GOTO" and element.t ~= "AUTO_ADD_COORDINATES_LOC"))
			then
				table.insert(filteredElements, element)
			end
		end
		if #filteredElements == 0 then loadLine = false end
		if loadLine then 
			stepNumber = stepNumber+1
			if step.eval and step.event then
				frameCounter = frameCounter + 1
				step.event = step.event:gsub("%s*","")
				if step.event == "" then step.event = "OnStepActivation" end
				local eventList = {}
				for event in step.event:gmatch('[^,]+') do
					table.insert(eventList,event)
				end
				local args = {}
				local eval = nil
				for arg in step.eval:gmatch('[^,]+') do
					if not eval then
						eval = arg:gsub("%s*","")
					else
						local c = string.match(arg,"^%s*(.*%S+)%s*$")
						if c then table.insert(args,c) end
						--print(arg)
					end
				end
				--print(tostring(step.eval)..":"..tostring(step.event))
				Guidelime_Zarant:RegisterStep(eventList,eval,args,stepNumber,stepLine,frameCounter)
			end
		end
	end
	return r
end


function addon.updateSteps(...)

	local eventFrame = Guidelime_Zarant.eventFrame
	if not eventFrame then
		return updateStepsOLD(...)
	end

	local isStepActive = {}
	for i,v in ipairs(eventFrame) do
		if v.data and v.data.step then
			isStepActive[i] = v.data.step.active
		end
	end

	local r = updateStepsOLD(...)

	for i,v in ipairs(eventFrame) do
		if v.data and v.data.step then
			local step = v.data.step
			if v.OnStepActivation and step.active and not isStepActive[i] then
				v.OnStepActivation(v.data,v.args,"OnStepActivation")
			elseif v.OnStepCompletion and isStepActive[i] == not step.active and (step.completed or step.skip) then
				v.OnStepCompletion(v.data,v.args,"OnStepCompletion")
			end
		end
	end

	return r
end

local updateArrow = addon.updateArrow
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
	updateArrow()
end

function Guidelime_Zarant:SkipStep(value)
	if value ~= false then value = true end
	self.step.skip = value
	GuidelimeDataChar.guideSkip[addon.currentGuide.name][self.stepNumber] = self.step.skip
	addon.updateSteps({self.stepNumber})
end

function Guidelime_Zarant:UpdateStep()
	addon.updateSteps({self.stepNumber})
end

function Guidelime_Zarant.IsQuestComplete(id)
	for i = 1,GetNumQuestLogEntries() do
		local questLogTitleText, level, questTag, isHeader, isCollapsed, isComplete, frequency, questID = GetQuestLogTitle(i);
		if isComplete and questID == id then
			return true
		end
	end
end

function Guidelime_Zarant:LoadNextGuide(n)
	--print('a')
	if type(n) == "table" then
		--print(#n)
		n = unpack(n)
	end
	--print(self.guide.next, #self.guide.next)
	if not self.guide.next or (not n and #self.guide.next > 1) or #self.guide.next == 0 then
		return
	elseif not n or n == 0 then
		n = 1
	end

	addon.loadGuide(self.guide.group.." "..self.guide.next[n])
end

--https://wow.gamepedia.com/UiMapID/Classic
--OnStepActivation,ZONE_CHANGED,ZONE_CHANGED_NEW_AREA,NEW_WMO_CHUNK>>ZoneSkip,mapID
--WorldMapFrame.mapID to find the mapID
function Guidelime_Zarant:ZoneSkip(args,event)
	local mapID = args
	local guide
	if type(args) == 'table' then
		mapID,guide = unpack(args)
	end
	local currentMap = C_Map.GetBestMapForUnit("player")
	if self.map[mapID] then
		mapID = self.map[mapID]
	else
		mapID = tonumber(mapID)
	end
	--print(mapID,currentMap)
	if mapID == currentMap then
		self:SkipStep()
		if guide then
			self:LoadNextGuide(tonumber(guide))
		end
		return true
	end
end


function Guidelime_Zarant.RemoveQuestRequirement(id,arg)
	if not addon.questsDB[id] then
		return false
	elseif not arg or arg == "prequests" then
		addon.questsDB[id]["prequests"] = nil
		addon.questsDB[id]["oneOfPrequests"] = nil
		return true
	elseif arg == "faction" or arg == "classes" or arg == "req" then
		addon.questsDB[id][arg] = nil
		return true
	else
		return false
	end
end

Guidelime_Zarant.RemoveQuestRequirement(353,"prequests")
Guidelime_Zarant.RemoveQuestRequirement(614,"faction")
Guidelime_Zarant.RemoveQuestRequirement(615,"faction")
Guidelime_Zarant.RemoveQuestRequirement(5237,"faction")
Guidelime_Zarant.RemoveQuestRequirement(5238,"faction")
Guidelime_Zarant.RemoveQuestRequirement(8553,"faction")
Guidelime_Zarant.RemoveQuestRequirement(5092,"prequests")
Guidelime_Zarant.RemoveQuestRequirement(8551,"faction")


--[[
>> https://wow.gamepedia.com/Patch_6.0.2/API_changes
For players: Player-[server ID]-[player UID] (Example: "Player-976-0002FD64")
For battle pets: BattlePet-0-[Battle Pet UID] (Example: "BattlePet-0-000000E0156B")
For creatures, pets, objects, and vehicles: [Unit type]-0-[server ID]-[instance ID]-[zone UID]-[ID]-[Spawn UID] (Example: "Creature-0-976-0-11-31146-000136DF91")
Unit Type Names: "Creature", "Pet", "GameObject", and "Vehicle"
For vignettes: Vignette-0-[server ID]-[instance ID]-[zone UID]-0-[spawn UID] (Example: "Vignette-0-970-1116-7-0-0017CAE465" for rare mob Sulfurious)
]]

function Guidelime_Zarant.NpcId(unit)
	if not unit then
		unit = "target"
	end
	local _, _, _, _, _, npcId = strsplit('-', UnitGUID(unit) or '')
	return tonumber(npcId)
end


function Guidelime_Zarant:Vendor(args,event)
	local id = args
	if type(args) == "table" then
		id = unpack(args)
	end
	
	if event == "MERCHANT_SHOW" then
		self.merchant = true
		self.activity = false
		if	Guidelime_Zarant.NpcId() == id then
			self.merchant = id
		end
	elseif event == "PLAYER_MONEY" and self.merchant then
		self.activity = true
	elseif event == "MERCHANT_CLOSED" and (self.merchant == id or self.merchant == true) then
		self.merchant = false
		if self.activity then
			self.activity = false
			self:SkipStep()
		else
			C_Timer.After(1.0,function()
				if not self.merchant then
					self:SkipStep()
				end
			end)
		end
	end
end

function Guidelime_Zarant:Trainer(args,event)
	local id = args
	if type(args) == "table" then
		id = unpack(args)
	end
	
	if event == "TRAINER_SHOW" then
		if	Guidelime_Zarant.NpcId() == id then
			self.trainer = id
		end
	elseif event == "TRAINER_CLOSED" and (self.trainer == id or not id) then
		self:SkipStep()
	end
end
--CHAT_MSG_SYSTEM>>SpellLearned
function Guidelime_Zarant:SpellLearned(args,event,msg)
	local spell = args
	local rank
	if type(args) == "table" then
		spell,rank = unpack(args)
	end
	
	local s,r
    if msg and event == "CHAT_MSG_SYSTEM" then
		s,r = string.match(msg,"You have learned a new %a+%:%s(.*)%s%(Rank%s(%d+)%)")
		if not s then
			s,r = string.match(msg,"Your pet has learned a new %a+%:%s(.*)%s%(Rank%s(%d+)%)")
		end
    end
    if not s then return end
	

	if (s == spell or not spell) and (r == rank or not rank) then
		self:SkipStep()
	end
	
end

function Guidelime_Zarant:TameBeast(args,event,target,guid,spellId)
	if spellId == 1515 then
		for i,id in ipairs(args) do
			if id == Guidelime_Zarant.NpcId() then
				self:SkipStep()
				return
			end
		end
	end
end

function Guidelime_Zarant:BindLocation(args)
	local location = GetBindLocation()
	local r
	if args[2] then
		r = false
	else
		r = true
	end
	
	if args[1] and (location == args[1]) == r then
		self:SkipStep()
		return true
	end
end

function Guidelime_Zarant:SkipGossip(args,event)
	
	if event == "GOSSIP_SHOW" then
		if #args == 0 then
			if GetNumGossipAvailableQuests() == 0 and GetNumGossipActiveQuests() == 0 then
				SelectGossipOption(1)
			end
			return
		end
		local id = tonumber(args[1])
		local npcId = z.NpcId()		
		if #args == 1 then
			if id < 10 or npcId == id then
				id = 1
			else
				return
			end
			if GetNumGossipAvailableQuests() == 0 and GetNumGossipActiveQuests() == 0 then
				SelectGossipOption(id)
			end
		elseif id == npcId then
			if not self.npcId then
				self.index = 2
				self.npcId = id
			else
				self.index = ((self.index -1) % (#args-1))+2
			end
			local option = tonumber(args[self.index])
			if option then
				SelectGossipOption(option)
			end
		end
	else
		self.npcId = nil
	end
end

function Guidelime_Zarant:Collect(args) --OnStepActivation,BAG_UPDATE>>Collect,id,qty,id,qty...

	if not self.id then
		self.id = {}
		self.quantity = {}
		for i,v in ipairs(args) do
			local value = tonumber(v)
			if value and i % 2 == 1 then
				table.insert(self.id,value)
			elseif i % 2 == 0 then
				if not value then value = 1 end
				table.insert(self.quantity,value)
			end
		end
	end
	
	local step = self.step
	if not self.element then
		table.insert(step.elements,{})
		self.element = #step.elements
	end

	local element = step.elements[self.element]
	element.textInactive = ""
	element.text = ""
	
	local skip = true
	for i,itemID in ipairs(self.id) do
		local count = GetItemCount(itemID)
		local name = GetItemInfo(itemID)
		local icon
		if count < self.quantity[i] then
			skip = false
			icon = "|T" .. addon.icons.item .. ":12|t"
		else
			count = self.quantity[i]
			icon = "|T" .. addon.icons.COMPLETED .. ":12|t"
		end
		if name then
			element.text = string.format("%s\n   %s%s: %d/%d",element.text,icon,name,count,self.quantity[i])
		end
	end
	
	if skip then
		element.text = ""
		self:SkipStep()
		return
	end

	self:UpdateStep()
end

function Guidelime_Zarant:Reputation(args) --UPDATE_FACTION>>Reputation,id,standing
	local factionID = tonumber(args[1])
	local goal = self.standingID[args[2]] or tonumber(args[2])
	
	
	if not goal then return end
	local name, description, standingID, barMin, barMax, barValue = GetFactionInfoByID(factionID)
	local standing = getglobal("FACTION_STANDING_LABEL"..standingID)

	local step = self.step
	if not self.element then
		table.insert(step.elements,{})
		self.element = #step.elements
	end

	local element = step.elements[self.element]
	element.textInactive = ""
	element.text = ""
	
	if standingID >= goal then
		self:SkipStep()
	else
		element.text = string.format("\n   |T%s:12|t%d/%d (%s)",addon.icons.object,barValue,barMax,standing)
	end

end

