if not Guidelime.Zarant or Guidelime.Zarant.Modules.Functions then return end
Guidelime.Zarant.Modules.Functions = true

local name,addon = ...
if Guidelime.addon then
	addon = Guidelime.addon
end

local z = Guidelime.Zarant

function Guidelime.Zarant:SkipStep(value)
	if not self.step.index then return end
	if value ~= false then value = true end
	self.step.skip = value
	--print(self.step.index,self.step.index)
	GuidelimeZarantDataChar.guideSkip[addon.currentGuide.name][self.step.index] = self.step.skip
	addon.updateSteps({self.step.index})
end

function Guidelime.Zarant:UpdateStep()
	addon.updateSteps({self.step.index})
end

function Guidelime.Zarant:UpdateText()
	addon.updateStepsText()
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

function Guidelime.Zarant.Collect(self,args,event,itemId,success) --OnStepActivation,BAG_UPDATE>>Collect,id,qty,id,qty...
	if not self then 
		return "OnStepActivation,BAG_UPDATE,GET_ITEM_INFO_RECEIVED"
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
		if #self.id == #self.quantity+1 then
			table.insert(self.quantity,1)
		end
	end
	
	if event == "GET_ITEM_INFO_RECEIVED" then
		local id
		for i,v in pairs(self.id) do
			if v == itemId then
				id = itemId
			end
		end
		if not (id and success) then
			return
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
		local name = GetItemInfo(itemID)
		local icon,count
		if name then
			count = GetItemCount(itemID)
			if count < self.quantity[i] then
				skip = false
				icon = "|T" .. addon.icons.item .. ":12|t"
			else
				count = self.quantity[i]
				icon = "|T" .. addon.icons.COMPLETED .. ":12|t"
			end
			element.text = string.format("%s\n   %s%s: %d/%d",element.text,icon,name,count,self.quantity[i])
		--[[elseif not self.timer or GetTime()-self.timer > 2.0 then
			self.timer = GetTime()
			C_Timer.After(2.0,function()
				self:Collect(args)
			end)]]
		end
	end
	
	if skip then
		element.text = ""
		self:SkipStep()
		return
	end

	self:UpdateText()
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

end


local repStandingID = {
	["hated"] = 1,
	["hostile"] = 2,
	["unfriendly"] = 3,
	["neutral"] = 4,
	["friendly"] = 5,
	["honored"] = 6,
	["revered"] = 7,
	["exalted"] = 8,
}

local repStartValue = {
-42000,--hated
-6000,--hostile
-3000,--unfriendly
0,--neutral
3000,--friendly
9000,--honored
21000,--revered
42000,--exalted
}

function Guidelime.Zarant.Reputation(self,args)
-->>Reputation,id,standing,value(optional)
	if not self then 
		return "OnStepActivation,UPDATE_FACTION"
	end
	if event == "OnStepActivation" then
		arg[1]:gsub("(!?)%s*(%d+)",function(mode,id)
			if mode == "!" then
				self.mode = false
			else
				self.mode = true
			end
			self.factionID = tonumber(id)
		end)
		if not self.element then
			local step = self.step
			table.insert(step.elements,{})
			self.element = step.elements[#step.elements]
			self.element.textInactive = ""
		end
	end	
	local standing = repStandingID[string.lower(args[2])] or tonumber(args[2])
	if not (standing and self.factionID) then
		
		return print('Error parsing guide at line '..self.step.line..': invalid faction/standing') 
	end
	
	local value = tonumber(args[3]) or 0
	local goal = repStartValue[standing] + value
	
	if not goal then return end
	local name, description, standingID, barMin, barMax, barValue = GetFactionInfoByID(self.factionID);

	self.element.text = ""
	
	if (barValue >= goal) == self.mode then
		self:SkipStep()
	else
		self.element.text = string.format("\n   |T%s:12|t%s: %d/%d ",addon.icons.npc,name,barValue-barMin,goal-barMin)
		self:UpdateText()
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

function Guidelime.Zarant.Train(self,args,event,spellId)
	if not self then 
		return "LEARNED_SPELL_IN_TAB,TRAINER_CLOSED,OnStepActivation,OnStepCompletion"
	end
	
	if event == "LEARNED_SPELL_IN_TAB" then
		local name = GetSpellInfo(spellId)
		local rank = self.skillList[name]
		
		if rank and (rank == GetSpellSubtext(spellId) or rank == "" or rank == 0) then
			self.spellsTrained = self.spellsTrained+1
		end
		
	elseif event == "OnStepActivation" then
		if not self.skillList then
			self.skillList = {}
			self.spellsTrained = 0
		end
		for _,v in pairs(args) do
			local spell, rank = string.match(v,"%s*(%w.*%w)%s*%((.+)%)")
			--print(spell,rank)
			if not spell then 
				spell = v
				rank = 0
			end
			self.skillList[spell] = rank
			Guidelime.Zarant.skillList[spell] = rank
		end
	elseif event == "TRAINER_CLOSED" and self.spellsTrained >= #self.skillList then
		self:SkipStep()
	elseif event == "OnStepCompletion" then
		for spell,rank in pairs(self.skillList) do
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
	local previous = self.step.line-1
	if previous <= 0 then
		return
	end
	local lastStep = self.guide.steps[previous]
	self.step.optional = true
	self.step.branch = true
	if lastStep.root then
		self.step.root = lastStep.root
	elseif args[1] then
		self.step.root = self.step.line
	else
		self.step.root = previous
	end
	
	local active
	for i = self.step.root,previous do
		if self.guide.steps[i].active then
			active = true
		end
	end
	local skip = GuidelimeZarantDataChar.guideSkip[addon.currentGuide.name][self.step.index]
	if self.step.active and active then
		if not self.step.skip then
			self.step.skip = true
			addon.updateSteps({self.step.index})
		end
	end
	if event == "OnStepCompletion" then
		local nextGuide = self.guide.steps[self.step.line+1]
		if nextGuide.branch then
			nextGuide.skip = false or skip
			addon.updateSteps({self.step.index+1})
		end
	elseif event == "OnStepActivation" then
		addon.updateSteps({self.step.index+1})
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

function Guidelime.Zarant.PlayerBuff(self,args,event,target,guid,spellId)
-->>PlayerBuff,buffNameOrId,persistent
	if not self then 
		return "OnStepActivation,UNIT_AURA:player"
	end
	
	
	if event == "OnStepActivation" then
		self.buffName = args[1]
		self.buffCheck = true
		self.buffName:gsub("%s*(!?)(.*%S)",function(mode,name)
			local id = tonumber(name)
			if id then
				self.buffName = GetSpellInfo(id)
			else
				self.buffName = name
			end
			if mode == "!" then
				self.buffCheck = nil
			end
		end)
		if args[2] then
			self.persistent = true
		end
	elseif not self.buffName then
		return
	end

	local isBuffPresent
	local i = 1
	local name = UnitBuff("player",i)
	while name do
		if name == self.buffName then
			isBuffPresent = true 
			name = nil
		end
		i = i+1
		name = UnitBuff("player",i)
	end

	if isBuffPresent == self.buffCheck then 
		self:SkipStep()
	elseif not self.step.active then
		self:SkipStep(false)
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

function Guidelime.Zarant.BlastedLandsQuests(self)
	--14 Vulture Gizzard\\11 Basilisk Brain\\6 Scorpok Pincer\\6 Blasted Boar Lung\\5 Snickerfang Jowl

	if not self then
		return "OnStepActivation,BAG_UPDATE"
	end
	local step = self.step
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
		self:SkipStep()
		return
	end

	self:UpdateText()

end