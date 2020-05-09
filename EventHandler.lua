if not Guidelime_Zarant then
	return 
end

local z = Guidelime_Zarant
local name = ...
local _, class = UnitClass("player")

local questRewardList


z.EventHandler = CreateFrame("Frame")
local EventHandler = z.EventHandler
EventHandler:RegisterEvent("TRAINER_SHOW")
EventHandler:RegisterEvent("TRAINER_UPDATE")
EventHandler:RegisterEvent("QUEST_COMPLETE")
EventHandler:RegisterEvent("BAG_UPDATE")
EventHandler:RegisterEvent("PLAYER_REGEN_ENABLED")
EventHandler:RegisterEvent("MERCHANT_SHOW")
EventHandler:RegisterEvent("ADDON_LOADED")
EventHandler:RegisterEvent("CHAT_MSG_SYSTEM")
--EventHandler:RegisterAllEvents()

local trainerUpdate = GetTime()

function z.BuySpells(id,level)
	local name, rank, category, expanded = GetTrainerServiceInfo(id);
	if category ~= "available" then
		return
	end
	
	for trainingLevel,spellList in pairs(GuidelimeData.trainerData[class]) do
		if trainingLevel <= level then
			for _,spell in ipairs(spellList) do
				if spell[1] == name and (rank == spell[2] or not rank or rank == "") then
					BuyTrainerService(id)
				end
			end
		end
	end
end

local function OnTrainer()
	local level = UnitLevel("player")
	local n = GetNumTrainerServices()
	if not n or n == 0 then
		return
	end
	trainerUpdate = GetTime()
	for id = 1,n do
		z.BuySpells(id,level)
	end
end


local questId

local function GetQuestRewardData(n)
	if n and n > 0 and questId and not GuidelimeDataChar.questRewardList[questId] then
		GuidelimeDataChar.questRewardList[questId] = n
	end
end
hooksecurefunc("GetQuestReward", GetQuestRewardData)



local foodList = z.foodList
local projectileList = z.projectileList

local projectileType = 0
local quiverFreeSlots = 0
local quiverSlot

local numQuiverSlots

local function UpdateQuiverInfo()
	quiverSlot = nil
	for bag = BACKPACK_CONTAINER, NUM_BAG_FRAMES do
		local numSlots, bagType = GetContainerNumFreeSlots(bag)
		if bagType == 1 or bagType == 2 then
			quiverSlot = bag
			projectileType,quiverFreeSlots = bagType,numSlots
		end
	end
	
	if quiverSlot then
		numQuiverSlots = GetContainerNumSlots(quiverSlot)
		return true
	else
		return false
	end

end

function z.ProjectileCount(id)
	local total = 0
	local pLevel = UnitLevel("player")
	if not id and projectileType > 0 then
		for i,lvl in pairs(projectileList[projectileType]) do
			if lvl <= pLevel then
				total = total + GetItemCount(i)
			end
		end
	elseif id then
		total = GetItemCount(id)
	end
	return total
end

local function QuiverCapacity()
	if UpdateQuiverInfo() then
		return numQuiverSlots*200
	else
		return 0
	end
end

function z.GetProjectileId(level)
	local playerLevel = UnitLevel("player")
	local maxLevel = 0
	local id
	for i,itemLevel in pairs(projectileList[projectileType]) do
		if level == itemLevel then
			id = i
			break
		elseif itemLevel > maxLevel and itemLevel <= playerLevel then
			id = i
			maxLevel = itemLevel
		end
	end
	return id
end

function z.BuyAmmo(stacks,fillQuiver,projectileLevel)
	
	local capacity = QuiverCapacity()
	if capacity == 0 then
		return 0
	end
	
	if type(fillQuiver) == "number" then
		local t = projectileLevel
		projectileLevel = fillQuiver
		fillQuiver = t
	end
	if (stacks == 0 and not fillQuiver) then
		return 0
	end
	if not stacks then
		stacks = 0
		fillQuiver = true
	end
	if stacks < 0 then
		fillQuiver = true
	end
	
	local current = z.ProjectileCount()
	local goal
	if fillQuiver then
		goal = capacity+stacks*200
	else
		goal = stacks*200
	end
	local purchaseAmount = goal - current
	if purchaseAmount > 0 then
		local id = z.GetProjectileId(projectileLevel)
		z.BuyItem(id,purchaseAmount)
		return purchaseAmount/200
	else
		return 0
	end
end

local organizeQuiver
function z.SortQuiver() --Makes sure you only have 1 partial stack at the left most quiver slot for each ammo type
	local previousState = organizeQuiver
	organizeQuiver = false
	
	if not UpdateQuiverInfo() then return end
	local id
	local closestSlot = {}

	for slot = 1, numQuiverSlots do
		id = GetContainerItemID(quiverSlot, slot)
		
		if id then
			if not closestSlot[id] then
				closestSlot[id] = numQuiverSlots
			end
			local maxStack = select(8, GetItemInfo(id))
			local stack = select(2, GetContainerItemInfo(quiverSlot, slot))
			if slot < closestSlot[id] then
				closestSlot[id] = slot
			elseif stack < maxStack then
				organizeQuiver = true
				if not GetCursorInfo() then
					C_Timer.After(0.01,function()
						PickupContainerItem(quiverSlot, slot)
						PickupContainerItem(quiverSlot, closestSlot[id])
					end)
					return
				end
			end
		end
		
	end
	if previousState then
		z.MoveAmmo()
	end
end

local moveTicker
function z.MoveAmmo()
	if not UpdateQuiverInfo() then 
		return
	elseif quiverFreeSlots <= 0 then
		organizeQuiver = true
		return
	end
	local bagContents = {}
	for bag = BACKPACK_CONTAINER, NUM_BAG_FRAMES do
		local slots, bagtype = GetContainerNumFreeSlots(bag)
		if bagtype == 0 then
			for slot = 1,GetContainerNumSlots(bag) do
				local id = GetContainerItemID(bag, slot)
				--print(id)
				if id and z.projectileList[projectileType][id] then

					C_Timer.After(0.01,function()
						PickupContainerItem(bag,slot)
						z.PutItemInQuiver(bagContents)
					end)
				end
			end
		end
	end
	organizeQuiver = true
end



function z.BuyItem(id,total)
	for i=1,GetMerchantNumItems() do
		local link = GetMerchantItemLink(i)
		local itemID = link and tonumber(link:match("item:(%d+)"))
		if itemID then
			local name, texture, price, quantity = GetMerchantItemInfo(i)
			
			if itemID == id or name == id then
				if quantity and quantity > 1 then
					for n=1,math.ceil(total/quantity) do
						BuyMerchantItem(i, quantity)
					end
				elseif quantity == 1 then
					local stack = select(8,GetItemInfo(id))
					while total > 0 do
						local purchase = math.min(stack,total)
						total = total - purchase
						BuyMerchantItem(i, purchase)
					end
				end
				return
			end
		end
	end
end


local function GetFoodLevel(id,index)
	local level = UnitLevel("player")
	if level >= 5 and level <= 16 then
		foodLevel = 5
	elseif level >= 15 and level < 25 then
		foodLevel = 15
	elseif level >= 25 and level < 35 then
		foodLevel = 25
	elseif level >= 35 and level < 35 then
		foodLevel = 35
	elseif level >= 45 and level < 45 then
		foodLevel = 45
	end
	
	if not id and not index then
		return foodLevel
	end
	
	for _,spellId in ipairs(foodList[index][foodLevel]) do
		if spellId == id then 
			return true
		end
	end
	return false
end



function z.BuyFoodAndDrink(food,drink)
	local total = {food,drink}
	local current = {0,0}
	for bag = BACKPACK_CONTAINER, NUM_BAG_FRAMES do
		for slot = 1,GetContainerNumSlots(bag) do
			local id = GetContainerItemID(bag, slot)
			if id then
				local name,spellId = GetItemSpell(id)
				--print(name,spellId)
				local index = 0
				if name == "Food" then
					index = 1
				elseif name == "Drink" then
					index = 2
				end
				if index > 0 and GetFoodLevel(spellId,index) then
					local _, itemCount = GetContainerItemInfo(bag,slot)
					current[index] = current[index] + itemCount
				end
			end
		end
	end
	--print(current[1],current[2])
	total[1] = total[1] - current[1]
	total[2] = total[2] - current[2]
	for i=1,GetMerchantNumItems() do
		local link = GetMerchantItemLink(i)
		local itemID = link and tonumber(link:match("item:(%d+)"))
		if itemID then
			local name, texture, price, quantity = GetMerchantItemInfo(i)
			local spellName, spellId = GetItemSpell(itemID)
			local index = 0
			if spellName == "Food" then
				index = 1
			elseif spellName == "Drink" then
				index = 2
			end
			--print(spellName,spellId)
			if index > 0 and total[index] > 0 and GetFoodLevel(spellId,index) then
				if quantity and quantity > 1 then
					for n=1,math.ceil(total[index]/quantity) do
						BuyMerchantItem(i, quantity)
					end
				elseif quantity == 1 then
					local stack = select(8,GetItemInfo(id))
					while total[index] > 0 do
						local purchase = math.min(stack,total[index])
						total[index] = total[index] - purchase
						BuyMerchantItem(i, purchase)
					end
				end
				--return
			end
		end
	end
end



function z.BuyMudSlappers(qty)
	local level = UnitLevel("player")
	local purchase,id
	id = 4592
	purchase = qty - GetItemCount(id)
	z.BuyItem(id,purchase)
end


local merchantTimer = 0
local function Merchant()
	if not GuidelimeData.Merchant then
		return
	end
	
	if GetTime() - merchantTimer < 1 then
		return
	else
		merchantTimer = GetTime()
	end
	
	local level = UnitLevel("player")
	local percent = (level/UnitXPMax("player"))
	local stacks
	local id = z.NpcId()
	if level < 16 then
		if id == 3589 then
			stacks = 2
		else
			stacks = 3
		end
		z.BuyAmmo(stacks)
		if level >= 11 and id ~= 4169 then --jaenea
			z.BuyMudSlappers(10)
			z.BuyFoodAndDrink(0,10)
		end
	elseif level >= 16 and level < 19 then
		if id ~= 4173 then --Landria
			z.BuyAmmo(-1)
		end
		z.BuyFoodAndDrink(20,20)
	elseif level >= 19 and level <= 24 then
		if IsQuestFlaggedCompleted(1016) then
			z.BuyAmmo(6)
		else
			z.BuyAmmo(4,true)
		end
		z.BuyFoodAndDrink(20,20)
	elseif level > 24 and level < 39 then
		z.BuyAmmo(3,true)
		z.BuyFoodAndDrink(20,20)
	elseif level > 39 and level < 49 then
		z.BuyFoodAndDrink(20,20)
		z.BuyAmmo(3,true)
	elseif level == 39 then
		stacks = z.BuyAmmo(math.ceil(14*(1-percent)))
		if IsQuestFlaggedCompleted(500) then
			z.BuyAmmo(math.ceil((15-stacks)*percent,40))
		end
		z.BuyFoodAndDrink(20,20)
	elseif level >= 49 and level < 60 then
		z.BuyFoodAndDrink(40,40)
		z.BuyAmmo(5,true)
	end
end


EventHandler:SetScript("OnEvent",function(self,event,arg1)

	if event == "TRAINER_SHOW" then
		OnTrainer()
	elseif event == "TRAINER_UPDATE" then
		C_Timer.After(0.1,function()
			if GetTime() - trainerUpdate >= 0.09 then
				OnTrainer()
			end
		end)
	elseif event == "QUEST_COMPLETE" then
		questId = GetQuestID()
		local reward = GuidelimeData.questRewardList[class] and GuidelimeData.questRewardList[class][questId]
		--print(reward)
		if reward then
			--C_Timer.After(0.01,function()
				GetQuestReward(reward)
			--end)
		end
	elseif (event == "PLAYER_REGEN_ENABLED" or event == "BAG_UPDATE") and not(InCombatLockdown() or UnitIsDead("player")) then	
		if moveTick then
			moveTick = false
			z.MoveAmmo()
		elseif organizeQuiver then
			z.SortQuiver()
		end
		
	elseif event == "MERCHANT_SHOW" then
		Merchant()
	elseif event == "MERCHANT_CLOSED" then
		C_Timer.After(2,function()
			z.MoveAmmo()
		end)
	elseif event == "ADDON_LOADED" and arg1 == name then
		z.OnLoad()
		local tick = GuidelimeData.moveTicker
		if tick then
			C_Timer.NewTicker(tick, function()
				moveTicker = true
			end)
		end
	elseif event == "CHAT_MSG_SYSTEM" and arg1 then
		local level = UnitLevel("player")
		local spell,rank = string.match(arg1,"You have learned a new %a+%:%s(.*)%s%((Rank%s%d+)%)")
		if spell then
			if GuidelimeDataChar.trainerData[level] then
				table.insert(GuidelimeDataChar.trainerData[level],{spell,rank})
			else
				GuidelimeDataChar.trainerData[level] = {{spell,rank}}
			end
		end
	end

end)