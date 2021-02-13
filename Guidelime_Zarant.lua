local name,addon = ...

if Guidelime.Zarant then
	return 
end
if addon.parseLine then
	Guidelime.Zarant = {}
	Guidelime.Zarant.addonTable = addon
elseif Guidelime.addon then
	Guidelime.Zarant = {}
	addon = Guidelime.addon
else
	return
end


Guidelime.Zarant.__index = Guidelime.Zarant
Guidelime.Zarant.Modules = {}


local z = Guidelime.Zarant
local parseLineOLD = addon.parseLine
local loadCurrentGuideOLD = addon.loadCurrentGuide
local updateStepsOLD = addon.updateSteps
local QUEST_GREETING_OLD = addon.frame.QUEST_GREETING
local npcList = {467,349,1379,7766,1978,7784,2713,2768,2610,2917,7806,3439,3465,3568,3584,4484,3692,4508,4880,4983,5391,5644,5955,7780,7807,7774,7850,8284,8380,8516,9020,9520,9623,9598,9023,9999,10427,10300,10646,10638,11016,11218,11711,11625,11626,1842,12277,12580,12818,11856,12858,12717,13716}


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


function Guidelime.Zarant:RegisterStep(eventList,eval,args,stepNumber,stepLine,frameCounter)
	
	if frameCounter > #self.eventFrame+1  then
		return
	end
	if #self.eventFrame < frameCounter then
		table.insert(self.eventFrame,CreateFrame("Frame"))
	end
	
	if type(self[eval]) ~= "function" then
		return 
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
		elseif event == "Persistent" then
			frame.data.persistent = true 
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

function Guidelime.Zarant:WipeData()
	if not self.eventFrame then
		self.eventFrame = {}
	end
	for _,frame in pairs(self.eventFrame) do
		Guidelime.mapIndex = nil
		Guidelime.defaultMap = nil
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

function addon.loadCurrentGuide(...)

	

	local guide = addon.guides[GuidelimeDataChar.currentGuide]
	local r = loadCurrentGuideOLD(...)
	if guide == nil then
		return r
	end
	Guidelime.Zarant:WipeData()
	
	local frameCounter = 0
	
	local stepNumber = 0
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
						--print(arg)
					end
				end
				step.event = step.event:gsub("%s*","")
				if step.event == "" then 
					step.event = Guidelime.Zarant[eval]() or "OnStepActivation"
					--print(step.eval,step.event)
				end
				local eventList = {}
				for event in step.event:gmatch('[^,]+') do
					table.insert(eventList,event)
				end
				--print(tostring(step.eval)..":"..tostring(step.event))
				Guidelime.Zarant:RegisterStep(eventList,eval,args,step.index,stepLine,frameCounter)
			end
		end
	end
	return r
end


function addon.updateSteps(...)

	local eventFrame = Guidelime.Zarant.eventFrame
	if not eventFrame then
		return updateStepsOLD(...)
	end

	local isStepActive = {}
	for i,v in ipairs(eventFrame) do
		if v.data and v.data.step then
			isStepActive[i] = v.data.step.active
			if v.OnStepUpdate then
				v.OnStepUpdate(v.data,v.args,"OnStepUpdate")
			end
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
	return updateArrow()
end

function Guidelime.Zarant:SkipStep(value)
	if not self.step.index then return end
	if value ~= false then value = true end
	self.step.skip = value
	print(self.stepNumber,self.step.index)
	GuidelimeDataChar.guideSkip[addon.currentGuide.name][self.step.index] = self.step.skip
	addon.updateSteps({self.step.index})
end

function Guidelime.Zarant:UpdateStep()
	addon.updateSteps({self.stepNumber})
end

function Guidelime.Zarant.IsQuestComplete(id)
	if IsQuestFlaggedCompleted(id) then
		return
	end

	for i = 1,GetNumQuestLogEntries() do
		local questLogTitleText, level, questTag, isHeader, isCollapsed, isComplete, frequency, questID = GetQuestLogTitle(i);
		if isComplete and questID == id then
			return true
		end
	end
end




function Guidelime.Zarant.LoadNextGuide(self,n)
	if not self then 
		return "OnStepCompletion"
	end
	--print('a')
	if type(n) == "table" then
		--print(#n)
		n = unpack(n)
	end
	n = tonumber(n)
	--print(self.guide.next, #self.guide.next)
	if not self.guide.next or (not n and #self.guide.next > 1) or #self.guide.next == 0 then
		return
	elseif not n or n == 0 then
		n = 1
	end
	--print(self.guide.group.." "..self.guide.next[n])
	addon.loadGuide(self.guide.group.." "..self.guide.next[n])
end

--https://wow.gamepedia.com/UiMapID/Classic
--OnStepActivation,ZONE_CHANGED,ZONE_CHANGED_NEW_AREA,NEW_WMO_CHUNK>>ZoneSkip,mapID
--WorldMapFrame.mapID to find the mapID
function Guidelime.Zarant.ZoneSkip(self,args,event)
	if not self then 
		return "OnStepActivation,ZONE_CHANGED,ZONE_CHANGED_NEW_AREA,NEW_WMO_CHUNK"
	end
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


function Guidelime.Zarant.RemoveQuestRequirement(id,arg)
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


Guidelime.Zarant.RemoveQuestRequirement(353,"prequests") --Stormpike's Delivery
Guidelime.Zarant.RemoveQuestRequirement(614,"faction")
Guidelime.Zarant.RemoveQuestRequirement(615,"faction")
Guidelime.Zarant.RemoveQuestRequirement(5237,"faction")
Guidelime.Zarant.RemoveQuestRequirement(5238,"faction")
Guidelime.Zarant.RemoveQuestRequirement(8553,"faction")
Guidelime.Zarant.RemoveQuestRequirement(5092,"prequests")
Guidelime.Zarant.RemoveQuestRequirement(8551,"faction")



Guidelime.Zarant.RemoveQuestRequirement(1365,"prequests") --Khan Dez'hepah
Guidelime.Zarant.RemoveQuestRequirement(6383,"prequests") --Ashenvale Hunt
Guidelime.Zarant.RemoveQuestRequirement(7792,"prequests")--A Donation of Wool(Darnassus)


--Fixes issues with the quest DB treating breadcrumb quests as mandatory pre-quests:
Guidelime.Zarant.RemoveQuestRequirement(1204,"prequests") --Mudrock soup and bugs
Guidelime.Zarant.RemoveQuestRequirement(5149,"prequests") --Pamela's Doll
Guidelime.Zarant.RemoveQuestRequirement(2518,"prequests") --Tears of the Moon
Guidelime.Zarant.RemoveQuestRequirement(1395,"prequests") --Supplies for Nethergarde
Guidelime.Zarant.RemoveQuestRequirement(5082,"prequests") --Threat of the Winterfall
Guidelime.Zarant.RemoveQuestRequirement(5096,"prequests") --Scarlet Diversions
Guidelime.Zarant.RemoveQuestRequirement(484,"prequests") --Young Crocolisk Skins

--[[
>> https://wow.gamepedia.com/Patch_6.0.2/API_changes
For players: Player-[server ID]-[player UID] (Example: "Player-976-0002FD64")
For battle pets: BattlePet-0-[Battle Pet UID] (Example: "BattlePet-0-000000E0156B")
For creatures, pets, objects, and vehicles: [Unit type]-0-[server ID]-[instance ID]-[zone UID]-[ID]-[Spawn UID] (Example: "Creature-0-976-0-11-31146-000136DF91")
Unit Type Names: "Creature", "Pet", "GameObject", and "Vehicle"
For vignettes: Vignette-0-[server ID]-[instance ID]-[zone UID]-0-[spawn UID] (Example: "Vignette-0-970-1116-7-0-0017CAE465" for rare mob Sulfurious)
]]

function Guidelime.Zarant.NpcId(unit)
	if not unit then
		unit = "target"
	end
	local _, _, _, _, _, npcId = strsplit('-', UnitGUID(unit) or '')
	return tonumber(npcId)
end

function Guidelime.Zarant.Vendor(self,args,event)
	if not self then 
		return "PLAYER_MONEY,MERCHANT_SHOW,MERCHANT_CLOSED"
	end
	local id = args
	if type(args) == "table" then
		id = unpack(args)
	end
	
	if event == "MERCHANT_SHOW" then
		self.merchant = true
		self.activity = false
		if	Guidelime.Zarant.NpcId() == id then
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

function Guidelime.Zarant.Trainer(self,args,event)
	if not self then 
		return "TRAINER_SHOW,TRAINER_CLOSED"
	end
	local id = args
	if type(args) == "table" then
		id = unpack(args)
	end
	
	if event == "TRAINER_SHOW" then
		if	Guidelime.Zarant.NpcId() == id then
			self.trainer = id
		end
	elseif event == "TRAINER_CLOSED" and (self.trainer == id or not id) then
		self:SkipStep()
	end
end

function Guidelime.Zarant.Stable(self,args,event)
	if not self then 
		return "PET_STABLE_SHOW,PET_STABLE_CLOSED"
	end
	local id = args
	if type(args) == "table" then
		id = unpack(args)
	end
	
	if event == "PET_STABLE_SHOW" then
		if	Guidelime.Zarant.NpcId() == id then
			self.trainer = id
		end
	elseif event == "PET_STABLE_CLOSED" and (self.trainer == id or not id) then
		self:SkipStep()
	end
end

function Guidelime.Zarant.SpellLearned(self,args,event,msg)
	if not self then 
		return "CHAT_MSG_SYSTEM"
	end
	local spell = args
	local rank
	if type(args) == "table" then
		spell,rank = unpack(args)
	end
	
	local s,r
    if msg and event == "CHAT_MSG_SYSTEM" then
		s,r = string.match(msg,"You have learned.+new %a+%:%s(.*)%s%(Rank%s(%d+)%)")
		if not s then
			s,r = string.match(msg,"Your pet has learned a new %a+%:%s(.*)%s%(Rank%s(%d+)%)")
		end
    end
    if not s then return end
	

	if (s == spell or not spell) and (r == rank or not rank) then
		self:SkipStep()
	end
	
end

function Guidelime.Zarant.TameBeast(self,args,event,target,guid,spellId)
	if not self then 
		return "UNIT_SPELLCAST_SUCCEEDED,UNIT_SPELLCAST_START,UNIT_SPELLCAST_FAILED"
	end
	if spellId == 1515 then
		if event == "UNIT_SPELLCAST_FAILED" then
			self.petId = nil
			return
		end
		for i,v in ipairs(args) do
			local id = tonumber(v)
			if event == "UNIT_SPELLCAST_START" and (id == self.NpcId(target) or id == self.NpcId()) then
				self.petId = id
			elseif id and event == "UNIT_SPELLCAST_SUCCEEDED" and (id == self.NpcId(target) or id == self.NpcId() or id == self.petId) then
				self.petId = nil
				self:SkipStep()
				return
			end
		end
	end
end

function Guidelime.Zarant.BindLocation(self,args)
	if not self then 
		return "OnStepActivation,CHAT_MSG_SYSTEM"
	end
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

function Guidelime.Zarant.SkipGossip(self,args,event)
	if not self then 
		return "GOSSIP_SHOW"
	end
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

function Guidelime.Zarant.Collect(self,args) --OnStepActivation,BAG_UPDATE>>Collect,id,qty,id,qty...
	if not self then 
		return "OnStepActivation,BAG_UPDATE"
	end
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
		elseif not self.timer or GetTime()-self.timer > 2.0 then
			self.timer = GetTime()
			C_Timer.After(2.0,function()
				self:Collect(args)
			end)
		end
	end
	
	if skip then
		element.text = ""
		self:SkipStep()
		return
	end

	self:UpdateStep()
end

function Guidelime.Zarant.Destroy(self,args) --OnStepActivation,BAG_UPDATE>>Destroy,id_1,id_2,id_3...
	if not self then 
		return "OnStepActivation,BAG_UPDATE"
	end
	local skip = true
	for i,itemID in ipairs(args) do
		local count = GetItemCount(tonumber(itemID))
		if count > 0 then
			skip = false
		end
	end
	
	if skip then
		self:SkipStep()
		return
	end

	self:UpdateStep()
end

function Guidelime.Zarant.Reputation(self,args) --UPDATE_FACTION>>Reputation,id,standing
	if not self then 
		return "OnStepActivation,UPDATE_FACTION"
	end
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

function Guidelime.Zarant.Unitscan(self,args,event)
	if not self then 
		return "OnStepActivation,OnStepCompletion"
	end
	if unitscan_targets then
		for _,v in ipairs(args) do
			local msg = ""
			local unit = strupper(v)
			if event == "OnStepActivation" then
				unitscan_targets[unit] = true
				msg = '+ ' .. unit
			elseif event == "OnStepCompletion" then
				unitscan_targets[unit] = nil
				msg = '- ' .. unit
			end
			if DEFAULT_CHAT_FRAME and msg ~= "" then
				DEFAULT_CHAT_FRAME:AddMessage(LIGHTYELLOW_FONT_COLOR_CODE .. '<unitscan> ' .. msg)
			end
		end
	end 

end

function Guidelime.Zarant.Train(self,args,event,msg)
	if not self then 
		return "TRAINER_CLOSED,OnStepActivation,OnStepCompletion"
	end
	if type(args) ~= "table" then return end
	local spell,rank
	if event == "TRAINER_CLOSED" then
		C_Timer.After(5,function()
			if not ClassTrainerFrame:IsShown() then
				self:SkipStep()
			end
		end)
	elseif event == "OnStepActivation" then
		self.skillList = {}
		self.spellsTrained = 0
		for _,v in pairs(args) do
			spell, rank = string.match(v,"%s*(%w.*%w)%s*%((.+)%)")
			--print(spell,rank)
			if not spell then 
				spell = v
				rank = 0
			end
			Guidelime.Zarant.skillList[spell] = rank
			self.skillList[spell] = rank
		end
	elseif event == "OnStepCompletion" then
		self.skillList = nil
		for _,v in pairs(args) do
			spell, rank = string.match(v,"%s*(%w.*%w)%s*%((.+)%)")
			if not spell then 
				spell = v
				rank = 0 
			end
			Guidelime.Zarant.skillList[spell] = nil
		end
	end
end

Guidelime.Zarant.questRewards = {}
function Guidelime.Zarant.GetQuestReward(self,args,event)
	if not self then
		return "OnStepActivation,OnStepCompletion"
	end
	if not args[1] then
		return
	end
	local id = tonumber(args[1]) or args[1]

	if event == "OnStepCompletion" then
		Guidelime.Zarant.questRewards[id] = nil
	else
		Guidelime.Zarant.questRewards[id] = true
	end

end

function Guidelime.Zarant.BankDeposit(self,args,event)
	if not self then
		return "OnLoad,BANKFRAME_OPENED,BAG_UPDATE"
	end
	
	if event == "OnLoad" then
		self:SkipStep(false)
		self.items = {}
		for _,item in ipairs(args) do
			local id = tonumber(item) or item
			if item then
				table.insert(self.items,id)
			end
		end
	else
		if Guidelime.Zarant.IsItemNotInBags(self.items) then
			self:SkipStep()
			return
		end
		Guidelime.Zarant.DepositItems(self.items)		
	end
end

function Guidelime.Zarant.BankWithdraw(self,args,event)
	if not self then
		return "OnLoad,BANKFRAME_OPENED,BAG_UPDATE"
	end
	
	if event == "OnLoad" then
		self:SkipStep(false)
		self.items = {}
		for _,item in ipairs(args) do
			local id = tonumber(item) or item
			if item then
				table.insert(self.items,id)
			end
		end
	else
		if  Guidelime.Zarant.IsItemInBags(self.items) or Guidelime.Zarant.IsItemNotInBank(self.items) then
			self:SkipStep()
			return
		end
		Guidelime.Zarant.WithdrawItems(self.items)	
	end
end


function Guidelime.Zarant.HS(self,args,event)
	if not self then
		return "OnStepActivation,OnStepCompletion"
	end

	local goal = tonumber(args[1])
	if event == "OnStepCompletion" then
		self.timer = nil
	elseif goal then
		goal = goal * 60
		local start,duration = GetSpellCooldown(8690)
		local cooldown = duration+start-GetTime()
		if cooldown > goal then
			self.timer = true
			C_Timer.After(cooldown-goal,function()
				if self.timer then
					self:SkipStep()
				end
			end)
		end
	end

end

function Guidelime.Zarant.BranchOut(self,args,event)
	if not self then
		return "OnStepUpdate,OnStepActivation,OnStepCompletion"
	end
	local previous = self.stepLine-1
	if previous <= 0 then
		return
	end
	local lastStep = self.guide.steps[previous]
	self.step.optional = true
	self.step.branch = true
	if lastStep.root then
		self.step.root = lastStep.root
	elseif args[1] then
		self.step.root = self.stepLine
	else
		self.step.root = previous
	end
	
	local active
	for i = self.step.root,previous do
		if self.guide.steps[i].active then
			active = true
		end
	end
	local skip = GuidelimeDataChar.guideSkip[addon.currentGuide.name][self.stepNumber]
	if self.step.active and active then
		if not self.step.skip then
			self.step.skip = true
			addon.updateSteps({self.stepNumber})
		end
	end
	if event == "OnStepCompletion" then
		local nextGuide = self.guide.steps[self.stepLine+1]
		if nextGuide.branch then
			nextGuide.skip = false or skip
			addon.updateSteps({self.stepNumber+1})
		end
	elseif event == "OnStepActivation" then
		addon.updateSteps({self.stepNumber+1})
	end
	
end

function Guidelime.Zarant.CastSpell(self,args,event,target,guid,spellId)
	if not self then 
		return "UNIT_SPELLCAST_SUCCEEDED"
	end

	for i,v in ipairs(args) do
		local name = GetSpellInfo(spellId)
		if name == v or spellId == tonumber(v) then
			self:SkipStep()
			return
		end
	end

end


function Guidelime.Zarant.Map(self,args)
	if not self then 
		return "OnLoad"
	end
	Guidelime.defaultMap = Guidelime.defaultMap or {}
	Guidelime.mapIndex = Guidelime.mapIndex or {}
	if args[1] then
		table.insert(Guidelime.defaultMap,args[1])
		table.insert(Guidelime.mapIndex,self.step.index)
	end

end

function Guidelime.Zarant.FormatNumber(number,precision)
	if not precision then
		precision = 0
	end
	local integer = math.floor(number)
	local decimal = math.floor((number-integer)*10^precision+0.5)
	if decimal > 0 then
		decimal = '.'..tostring(decimal)
	else
		decimal = ""
	end
	integer = tostring(integer)
	local i = #integer % 3
	if i == 0 then
		i = 3
	end

	local suffix = string.sub(integer,i+1)
	integer = string.sub(integer,1,i)

	for n in string.gmatch(suffix,"%d%d%d") do
		integer = integer..","..n
	end
	return integer..decimal
end

function Guidelime.Zarant.BlastedLandsQuests(self) --BAG_UPDATE>>BlastedLandsQuests
	--14 Vulture Gizzard\\11 Basilisk Brain\\6 Scorpok Pincer\\6 Blasted Boar Lung\\5 Snickerfang Jowl
	if not self then
		return "OnStepActivation,BAG_UPDATE"
	end
	local step = self.guide.steps[self.stepLine]
	local name = {
		"Vulture Gizzard","Basilisk Brain","Blasted Boar Lung","Scorpok Pincer","Snickerfang Jowl"
	}
	local quests = {
		[2583] = {
			0, --gizzard
			1, --brain
			3, --lung
			2, --pincer
			0, --jowl
		},
		[2601] = {
			2,
			10,
			0,
			0,
			0,
		},
		[2585] = {
			2,
			0,
			1,
			3,
			0,
		},
		[2581] = {
			0,
			0,
			2,
			1,
			3,
		},
		[2603] = {
			10,
			0,
			0,
			0,
			2,
		}
	}
	local id = {
		8396,
		8394,
		8392,
		8393,
		8391,
	}

	local total = {
		0,
		0,
		0,
		0,
		0,
	}
	
	for quest,items in pairs(quests) do
		if not IsQuestFlaggedCompleted(quest) then
			for item,v in pairs(items) do
				total[item] = total[item] + v
			end
		end
	end
	
	local element = step.elements[#step.elements]
	local skip = true
	--element.textInactive = ""
	element.text = "Collect the following items:"
	
	for item,goal in pairs(total) do
		local itemCount = GetItemCount(id[item])
		if goal > 0 then
			if itemCount > goal then 
				itemCount = goal 
			end
			element.text = string.format("%s\n    %s: %d/%d",element.text,name[item],itemCount,goal)
		end
		if itemCount < goal then
			skip = false
		end
	end

	
	if skip then
		--element.text = ""
		z.SkipStep(self)
		return
	end

	self:UpdateStep()

end







--local GC_Settings = GuidelimeData.GC_Settings
GC__Frame = CreateFrame("Frame", "GC_Editor", UIParent)
local f = GC__Frame

local function ScrollDown()
f.SF:SetVerticalScroll(f.SF:GetVerticalScrollRange())
end
local function UpdateWindow()
	if GuidelimeData.GC_Settings["CurrentGuide"] then
		f.TextFrame.text:SetText("Current Guide: ...")
	else
		f.TextFrame.text:SetText("")
		return
	end
	if GuidelimeData.GC_Settings["CurrentGuide"] then
		f.Text:SetText(GuidelimeData.GC_Settings["CurrentGuide"])
	end
	f.Text:ClearFocus()
	ScrollDown()
end


local backdrop = {
		bgFile = "Interface/BUTTONS/WHITE8X8",
		edgeFile = "Interface/GLUES/Common/Glue-Tooltip-Border",
		tile = true,
		edgeSize = 8,
		tileSize = 8,
		insets = {
			 left = 5,
			 right = 5,
			 top = 5,
			 bottom = 5,
		},
}




f:Hide()

f:SetMovable(true)
f:SetClampedToScreen(true)
f:SetResizable(true)
f:SetScript("OnMouseDown", function(self, button)
	if IsAltKeyDown() then
		f:StartSizing("BOTTOMRIGHT")
	else
		f:StartMoving()
	end
end)
f:EnableMouse(1)
f:SetScript("OnMouseUp", function(self,button)
	f:StopMovingOrSizing()
	GuidelimeData.GC_Settings.width = f:GetWidth()
	GuidelimeData.GC_Settings.height = f:GetHeight()
end)
f:SetScript("OnShow", function(self)
	UpdateWindow()
end)



local width,height = 600,300

f:SetWidth(width)
f:SetHeight(height)
--f:SetSize(150, 150)
f:SetPoint("CENTER",0,0)
f:SetFrameStrata("BACKGROUND")
f:SetBackdrop(backdrop)
f:SetBackdropColor(0, 0, 0)
f.Close = CreateFrame("Button", "$parentClose", f)
f.Close:SetWidth(24)
f.Close:SetHeight(24)
f.Close:SetPoint("TOPRIGHT",0,0)
f.Close:SetNormalTexture("Interface/Buttons/UI-Panel-MinimizeButton-Up")
f.Close:SetPushedTexture("Interface/Buttons/UI-Panel-MinimizeButton-Down")
f.Close:SetHighlightTexture("Interface/Buttons/UI-Panel-MinimizeButton-Highlight", "ADD")
f.Close:SetScript("OnClick", function(self)
		f:Hide()
end)
f.Select = CreateFrame("Button", "$parentSelect", f, "UIPanelButtonTemplate")
f.Select:SetWidth(70)
f.Select:SetHeight(14)
f.Select:SetPoint("RIGHT", f.Close, "LEFT")
f.Select:SetText("Select All")
f.Select:SetScript("OnClick", function(self)
		f.Text:HighlightText()
		f.Text:SetFocus()
end)
 
 f.Save = CreateFrame("Button", "$parentSave", f, "UIPanelButtonTemplate")
f.Save:SetWidth(70)
f.Save:SetHeight(14)
f.Save:SetPoint("RIGHT", f.Select, "LEFT")
f.Save:SetText("Save")
f.Save:SetScript("OnClick", function(self)
	GuidelimeData.GC_Settings["CurrentGuide"] = f.Text:GetText()
	print("Saved changes to Current Guide")
end)
f.TextFrame = CreateFrame("Frame", "$parentTextFrame", f)
f.TextFrame:SetPoint("RIGHT", f.Save,"LEFT")
f.TextFrame:SetWidth(70)
f.TextFrame:SetHeight(14)
f.TextFrame.text = f.TextFrame:CreateFontString(nil,"OVERLAY") 
f.TextFrame.text:SetFontObject(GameFontNormal)
f.TextFrame.text:SetPoint("TOPLEFT",10,-5)
f.TextFrame.text:SetJustifyH("RIGHT")
f.TextFrame.text:SetJustifyV("TOP")
f.TextFrame:SetPoint("TOPLEFT",0,0)



 
f.SF = CreateFrame("ScrollFrame", "$parent_DF", f, "UIPanelScrollFrameTemplate")
f.SF:SetPoint("TOPLEFT", f, 12, -30)
f.SF:SetPoint("BOTTOMRIGHT", f, -30, 10)



local backdrop = {
		bgFile = "Interface/BUTTONS/WHITE8X8",
		tile = true,
		edgeSize = 1,
		tileSize = 1,
		insets = {
			 left = 0,
			 right = 0,
			 top = 0,
			 bottom = 0,
		},
}

f.Text = CreateFrame("EditBox", nil, f)
f.Text:SetBackdrop(backdrop)
f.Text:SetBackdropColor(0.1,0.1,0.1)
f.Text:SetMultiLine(true)
--f.Text:SetSize(180, 170)
f.Text:SetWidth(width-45)
f.Text:SetPoint("TOPLEFT", f.SF)
f.Text:SetPoint("BOTTOMRIGHT", f.SF)
f.Text:SetFont("Interface\\AddOns\\GuideCreator\\fonts\\VeraMono.ttf",12)
f.Text:SetTextColor(1,1,1,1)
--f.Text:SetMaxLetters(99999)
f.Text:SetFontObject(GameFontNormal)
f.Text:SetAutoFocus(false)
f.Text:SetScript("OnEscapePressed", function(self) f.Text:ClearFocus() end) 
f.SF:SetScrollChild(f.Text)




function GC_Editor()
f:Show()
end

function ConvertGuide()
	local guide = addon.currentGuide
	NewGuide = {}
	local n = 1
	local addon = Guidelime.addon
	local delayedtext
	
	for i,step in pairs(guide.steps) do
		if step.index and step.index > 0 then
			local qID
			local skip
			local text = ""
			local x,y,map,semi,fp,fly,hs,generated
			local accept = {}
			local turnin = {}
			local complete = {}
			for _,element in pairs(step.elements) do
				if not qID then qID = tonumber(element.questId) end
			end
			for _,element in pairs(step.elements) do

				local title
				local hasgoto
				
				local realMap
				
				
				if element.text then
					text = text..element.text
				elseif element.title then
					title = element.title
					if title == "" or title == " " then title = "*" end
				elseif element.questId then
					title = C_QuestLog.GetQuestInfo(tonumber(element.questId)) or ""
				end
				
				if element.t == "TURNIN" then
					qID = tonumber(element.questId)
					turnin[qID] = 1
					if title then
						text = string.format("%s#TURNIN%s#",text,title)
						title = nil
					end
				elseif element.t == "ACCEPT" then
					qID = tonumber(element.questId)
					accept[qID] = 1
					if title then
						text = string.format("%s#ACCEPT%s#",text,title)
						title = nil
					end
				elseif element.t == "COMPLETE" then
					qID = tonumber(element.questId)
					complete[qID] = complete[qID] or 0x0
					local objective = tonumber(element.objective)
					if objective then
						complete[qID] = bit.bor(complete[qID],bit.lshift(0x1,objective-1))
					end
					if title then
						text = string.format("%s#DOQUEST%s#",text,title)
						title = nil
					end
				elseif element.t == "GOTO" and not x then
					print(realMap)
					hasgoto = true
					local isMapDefined
					if Guidelime.defaultMap then
						
						for i,v in ipairs(Guidelime.defaultMap) do
							local lowerbound = Guidelime.mapIndex[i]
							local upperbound
							
							if Guidelime.mapIndex[i+1] then
								upperbound = Guidelime.mapIndex[i+1]
							end
							
							if step.index >= lowerbound and (not upperbound or step.index < upperbound) then
								realMap = addon.mapIDs[v]
								isMapDefined = true
							end
						end

					end
					if not realMap and qID and addon.questsDB[qID] and addon.questsDB[qID].zone then realMap = addon.mapIDs[addon.questsDB[qID].zone] end
					if realMap and (element.generated and generated ~= false or isMapDefined) then
						x,y = HBD:GetZoneCoordinatesFromWorld(element.wx, element.wy, realMap)
						generated = true
						if x and y then
							x = math.floor(x*1e4)/1e2
							y = math.floor(y*1e4)/1e2
							map = C_Map.GetMapInfo(realMap).name
						else
							map = element.zone
							if not map and element.mapID then
								map = C_Map.GetMapInfo(element.mapID).name
							end
							if map then 
								x = element.x
								y = element.y
							end
						end
					else
						if not element.generated then generated = false end
						map = element.zone
						if not map and element.mapID then
							map = C_Map.GetMapInfo(element.mapID).name
						end
						
						if map then 
							
							
							x = element.x
							y = element.y
						else
							--print(step.index)
						end
					end
				elseif element.t == "GET_FLIGHT_POINT" then
					fp = true
					semi = "fp"
				elseif element.t == "SET_HEARTH" then
					semi = "home"
				elseif element.t == "FLY" then
					fly = true
					semi = "fly"
				elseif element.t == "HEARTH" then
					hs = true
				end
				
				
			end
			
			if fly and generated then
				x = nil
				y = nil
				map = nil
				hasgoto = nil
			end
			
			
			local optional = step.optional or step.completeWithNext
			if optional and not(hasgoto or semi) or hs then
				skip = 99
				if delayedtext then
					delayedtext = delayedtext.."\n"..text
				else
					delayedtext = text
				end 
			end
			
			if not skip then
				if delayedtext then
					text = delayedtext.."\n \n"..text
					delayedtext = nil
				end
				NewGuide[n] = {}
				
				--NewGuide[n].skip = skip
				NewGuide[n].str = text
				NewGuide[n].x = x
				NewGuide[n].y = y
				NewGuide[n].zone = map
				NewGuide[n].typ = semi
				NewGuide[n].QA = accept
				NewGuide[n].QT = turnin
				NewGuide[n].QC = complete
				n = n+1
			end
		end
		--print(text)
	end


local text = ""

for _,n in pairs(NewGuide) do
text = text.."\n{"
	if NewGuide[_].str then
		NewGuide[_].str = string.gsub(NewGuide[_].str,"\"","\\\"")
		local t = string.gsub(NewGuide[_].str,"\n","\\n")
		--print(text,i,t,v)
		text = string.format("%s str = \"%s\",",text,t)
	end
	for i,v in pairs(n) do
		if i == "str" then
			
		elseif type(v) == "table" then
			text = string.format("%s %s = {",text,i)
			if i ~= "QC" then
				for t,quest in pairs(v) do
					text = string.format("%s%d,",text,quest)
				end
			else
				for quest,t in pairs(v) do
					text = string.format("%s [%d] = %d,",text,quest,t)
				end
			end
			text = text.."},"
		elseif type(v) == "string" then
			local t = string.gsub(v,"\n","\\n")
			--print(text,i,t,v)
			text = string.format("%s %s = \"%s\",",text,i,t)
		else
			text = string.format("%s %s = %s,",text,i,v)
		end
	end
	text = text.."},"
end
text = string.gsub(text,",}","}")
text = string.gsub(text,", Q%w = {}","")

GuidelimeData.GC_Settings["CurrentGuide"] = text
f:Show()
end

