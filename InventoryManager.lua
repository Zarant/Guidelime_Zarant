if not Guidelime.Zarant or Guidelime.Zarant.Modules.InventoryManager then return end
local z = Guidelime.Zarant
Guidelime.Zarant.Modules.InventoryManager = true

function z.PutItemInBank(bagContents)
	local _,isBankOpened = GetContainerNumFreeSlots(BANK_CONTAINER);
	if CursorHasItem() and isBankOpened then
		local bank = {BANK_CONTAINER}
		for i = NUM_BAG_SLOTS+1, NUM_BAG_SLOTS+NUM_BANKBAGSLOTS do
			table.insert(bank,i)
		end
		
		if not bagContents then bagContents = {} end
		for _,bag in ipairs(bank) do
			if not bagContents[bag] then bagContents[bag] = {} end
			local slots, bagtype = GetContainerNumFreeSlots(bag)
			if bagtype == 0 and slots > 0 then
				for slot = 1,GetContainerNumSlots(bag) do
					if not (GetContainerItemInfo(bag,slot) or bagContents[bag][slot]) then
						PickupContainerItem(bag,slot)
						bagContents[bag][slot] = true
						return
					end
				end
			end
		end
		ClearCursor()
	end

end

function z.PutItemInBags(bagContents)
	if CursorHasItem() then
		if not bagContents then bagContents = {} end
		for bag = BACKPACK_CONTAINER, NUM_BAG_FRAMES do
			if not bagContents[bag] then bagContents[bag] = {} end
			local slots, bagtype = GetContainerNumFreeSlots(bag)
			if bagtype == 0 and slots > 0 then
				for slot = 1,GetContainerNumSlots(bag) do
					if not (GetContainerItemInfo(bag,slot) or bagContents[bag][slot]) then
						PickupContainerItem(bag,slot)
						bagContents[bag][slot] = true
						return
					end
				end
			end
		end
		ClearCursor()
	end
end

function z.PutItemInQuiver(bagContents)
	if CursorHasItem() then
		if not bagContents then bagContents = {} end
		for bag = BACKPACK_CONTAINER, NUM_BAG_FRAMES do
			if not bagContents[bag] then bagContents[bag] = {} end
			local slots, bagtype = GetContainerNumFreeSlots(bag)
			if (bagtype == 1 or bagtype == 2) and slots > 0 then
				for slot = 1,GetContainerNumSlots(bag) do
					if not (GetContainerItemInfo(bag,slot) or bagContents[bag][slot]) then
						PickupContainerItem(bag,slot)
						bagContents[bag][slot] = true
						return
					end
				end
			end
		end
		ClearCursor()
	end
end

--[[
function z.DepositQuestItems()
	local _,isBankOpened = GetContainerNumFreeSlots(BANK_CONTAINER);
	if not isBankOpened then
		return
	end
	local bagContents = {}
	for bag = BACKPACK_CONTAINER, NUM_BAG_FRAMES do
		for slot = 1,GetContainerNumSlots(bag) do
			local id = GetContainerItemID(bag, slot)
			if id then
				local itemtype = select(6,GetItemInfo(id))
				if itemtype == "Quest" then
					PickupContainerItem(bag,slot)
					z.PutItemInBank(bagContents)
				end
			end
		end
	end
end

function z.WithdrawQuestItems()
	local _,isBankOpened = GetContainerNumFreeSlots(BANK_CONTAINER);
	if not isBankOpened then
		return
	end
	local bank = {BANK_CONTAINER}
	for i = NUM_BAG_SLOTS+1, NUM_BAG_SLOTS+NUM_BANKBAGSLOTS do
		table.insert(bank,i)
	end
	
	local bagContents = {}
	
	for _,bag in ipairs(bank) do
		for slot = 1,GetContainerNumSlots(bag) do
			local id = GetContainerItemID(bag, slot)
			if id then
				local itemtype = select(6,GetItemInfo(id))
				if itemtype == "Quest" then
					PickupContainerItem(bag,slot)
					z.PutItemInBags(bagContents)
				end
			end
		end
	end	

end
]]

function z.GoThroughBags(itemList,func)
	local bagContents = {}
	for bag = BACKPACK_CONTAINER, NUM_BAG_FRAMES do
		for slot = 1,GetContainerNumSlots(bag) do
			local id = GetContainerItemID(bag, slot)
			if id then
				local name = GetItemInfo(id)
				for _,item in ipairs(itemList) do
					if item == name or item == id then
						func(bag,slot,bagContents)
					end
				end
			end
		end
	end

end

function z.DepositItems(itemList)
	local _,isBankOpened = GetContainerNumFreeSlots(BANK_CONTAINER);
	if itemList and isBankOpened then
		if type(itemList) ~= "table" then 
			itemList = {itemList}
		end
	else
		return
	end
	z.GoThroughBags(itemList,function(bag,slot,bagContents)
		PickupContainerItem(bag,slot)
		z.PutItemInBank(bagContents)
	end)
end

function z.IsItemInBags(itemList,reverseLogic)
	local _,isBankOpened = GetContainerNumFreeSlots(BANK_CONTAINER);
	if itemList and isBankOpened then
		if type(itemList) ~= "table" then 
			itemList = {itemList}
		end
	else
		return
	end
	for _,item in ipairs(itemList) do
		local itemCount = 0
		z.GoThroughBags({item},function()
			itemCount = itemCount + 1
		end)
		if reverseLogic then
			if itemCount >= 1 then
				return false
			end
		else
			if itemCount < 1 then
				return false
			end
		end
	end
	return true
end

function z.IsItemNotInBags(itemList)
	return z.IsItemInBags(itemList,true)
end

function z.GoThroughBank(itemList,func)
	
	local bank = {BANK_CONTAINER}
	for i = NUM_BAG_SLOTS+1, NUM_BAG_SLOTS+NUM_BANKBAGSLOTS do
		table.insert(bank,i)
	end
	
	local bagContents = {}
	
	for _,bag in pairs(bank) do
		for slot = 1,GetContainerNumSlots(bag) do
			local id = GetContainerItemID(bag, slot)
			if id then
				local name = GetItemInfo(id)
				for _,item in ipairs(itemList) do
					if item == name or item == id then
						func(bag,slot,bagContents)
					end
				end
			end
		end
	end	
	
end

function z.WithdrawItems(itemList)
	local _,isBankOpened = GetContainerNumFreeSlots(BANK_CONTAINER);
	if itemList and isBankOpened then
		if type(itemList) ~= "table" then 
			itemList = {itemList}
		end
	else
		return
	end
	z.GoThroughBank(itemList,function(bag,slot,bagContents)
		PickupContainerItem(bag,slot)
		z.PutItemInBags(bagContents)
	end)
end

function z.IsItemInBank(itemList,reverseLogic)
	local _,isBankOpened = GetContainerNumFreeSlots(BANK_CONTAINER);
	if itemList and isBankOpened then
		if type(itemList) ~= "table" then 
			itemList = {itemList}
		end
	else
		return
	end
	
	for _,item in ipairs(itemList) do
		local itemCount = 0
		z.GoThroughBank({item},function()
			itemCount = itemCount + 1
		end)
		if reverseLogic then
			if itemCount >= 1 then
				return false
			end
		else
			if itemCount < 1 then
				return false
			end
		end
	end
	return true
end

function z.IsItemNotInBank(itemList)
	return z.IsItemInBank(itemList,true)
end

function z.Strip()
	local t={18,16,17,5,7,1,3,6,8,9,10} 
	for b=0,4 do 
		n,bagType=GetContainerNumFreeSlots(b) 
		if n>0 and bagType == 0 then 
			for _,x in ipairs(t) do
				PickupInventoryItem(x)
				if CursorHasItem() then
					PutItemInBag(b+19)
					PutItemInBackpack()
					n=n-1 
				end
			end 
		end
	end
end
