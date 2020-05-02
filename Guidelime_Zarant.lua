
if not _GL then
	return 
end

local addon = _GL()
local L = addon.L
local parseLineOLD = addon.parseLine
local loadCurrentGuideOLD = addon.loadCurrentGuide

local eventFrame = {}
local frameCounter = 0

function Guidelime_Zarant.RegisterStep(eventList,eval,stepNumber,stepIndex)
	if #eventFrame < frameCounter then
		table.insert(eventFrame,CreateFrame("Frame"))
	end
	if Guidelime_Zarant[eval] then
	--print(step)
		local function EvaluateFunction(self,...)
			local guide = addon.guides[GuidelimeDataChar.currentGuide]
			print(stepNumber..' ('..stepIndex..')')
			--print(guide)
			if guide.steps[stepIndex].active then
				Guidelime_Zarant[eval](stepIndex,stepNumber,...)
			end
		end
		for _,event in pairs(eventList) do
			if event == "OnUpdate" then
				eventFrame[frameCounter]:SetScript("OnUpdate",EvaluateFunction)
			else
				eventFrame[frameCounter]:RegisterEvent(event)
			end
		end
		eventFrame[frameCounter]:SetScript("OnEvent",EvaluateFunction)
	end

end

function addon.parseLine(...)
	local step = ...
	if step.text then
		step.event, step.eval = string.match(step.text,"%-%-(.*)>>(.*)")
	end
	return parseLineOLD(...)
end



function addon.loadCurrentGuide(...)

	local r = loadCurrentGuideOLD(...)


	local guide = addon.guides[GuidelimeDataChar.currentGuide]
	if guide == nil then
		return
	end


	for _,frame in pairs(eventFrame) do
		frame:SetScript("OnUpdate", nil)
		frame:SetScript("OnEvent", nil)
		frame:UnregisterAllEvents()
	end
	frameCounter = 0
	local eventList = {}
	local stepNumber = 0
	for stepIndex, step in ipairs(guide.steps) do
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
		step.elements = filteredElements
		if #step.elements == 0 then loadLine = false print('dd') end
		if loadLine then 
			stepNumber = stepNumber+1
			if step.eval and step.event then
				frameCounter = frameCounter + 1
				step.eval = step.eval:gsub("%s*","")
				step.event = step.event:gsub("%s*","")
				if step.event == "" then step.event = "OnUpdate" end
				for event in step.event:gmatch('[^,]+') do
					table.insert(eventList,event)
					print(event)
				end
				print(tostring(step.eval)..":"..tostring(step.event))
				Guidelime_Zarant.RegisterStep(eventList,step.eval,stepNumber,stepIndex)
			end
		end
	end
	return r
end


function Guidelime_Zarant.SkipStep(i,value) --Uses the step number
	if value == nil then value = true end
	local indexes = {i}
	local step = addon.currentGuide.steps[i]
	step.skip = value
	GuidelimeDataChar.guideSkip[addon.currentGuide.name][i] = step.skip
	addon.updateSteps(indexes)
end

local function RemoveQuestRequirement(id,arg)
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

RemoveQuestRequirement(353,"prequests")
RemoveQuestRequirement(614,"faction")
RemoveQuestRequirement(615,"faction")
RemoveQuestRequirement(5237,"faction")
RemoveQuestRequirement(5238,"faction")
RemoveQuestRequirement(8553,"faction")
RemoveQuestRequirement(5092,"prequests")
RemoveQuestRequirement(8551,"faction")


function Guidelime_Zarant.sp1(stepIndex,stepNumber,...)
	event,arg1,arg2,arg3 = ...
	print(tostring(event)..':'..tostring(arg1)..'-'..tostring(arg3))
	--print(step)
	--print(guide)
	Guidelime_Zarant.SkipStep(stepNumber)
end


-- BANK_CONTAINER is the bank window
-- NUM_BAG_SLOTS+1 to NUM_BAG_SLOTS+NUM_BANKBAGSLOTS are your bank bags


local bagContents

function PutItemInBank()
	if GetCursorInfo() == "item" then
		local bank = {BANK_CONTAINER}
		for i = NUM_BAG_SLOTS+1, NUM_BAG_SLOTS+NUM_BANKBAGSLOTS do
			table.insert(bank,i)
		end
		
		for _,bag in pairs(bank) do
			if not bagContents[bag] then bagContents[bag] = {} end
			local slots, bagtype = GetContainerNumFreeSlots(bag)
			if bagtype == 0 and slots > 0 then
				for slot = 1,GetContainerNumSlots(bag) do
					if not (GetContainerItemInfo(bag,slot) or bagContents[bag][slot])then
						PickupContainerItem(bag,slot)
						bagContents[bag][slot] = true
						return
					end
				end
			end
		end	
	end

end

function PutItemInBags()
	if GetCursorInfo() == "item" then
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
	end
end

function DepositQuestItems()
	bagContents = {}
	for bag = BACKPACK_CONTAINER, NUM_BAG_FRAMES do
		for slot = 1,GetContainerNumSlots(bag) do
			local id = GetContainerItemID(bag, slot)
			if id then
				local itemtype = select(6,GetItemInfo(id))
				if itemtype == "Quest" then
					PickupContainerItem(bag,slot)
					PutItemInBank()
				end
			end
		end
	end
end


function WithdrawQuestItems()
	local bank = {BANK_CONTAINER}
	for i = NUM_BAG_SLOTS+1, NUM_BAG_SLOTS+NUM_BANKBAGSLOTS do
		table.insert(bank,i)
	end
	
	bagContents = {}
	
	for _,bag in pairs(bank) do
		for slot = 1,GetContainerNumSlots(bag) do
			local id = GetContainerItemID(bag, slot)
			if id then
				local itemtype = select(6,GetItemInfo(id))
				if itemtype == "Quest" then
					PickupContainerItem(bag,slot)
					PutItemInBags()
				end
			end
		end
	end	

end
