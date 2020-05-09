if not Guidelime_Zarant then return end
local z = Guidelime_Zarant
local _, class = UnitClass("player")

GuidelimeDataChar = GuidelimeDataChar or {}
GuidelimeData = GuidelimeData or {}
function z.OnLoad()
	
	GuidelimeDataChar.trainerData = GuidelimeDataChar.trainerData or {}
	GuidelimeData.trainerData = GuidelimeData.trainerData or {}
	GuidelimeData.trainerData[class] = GuidelimeData.trainerData[class] or {}

	GuidelimeData.questRewardList = GuidelimeData.questRewardList or {}
	GuidelimeData.questRewardList[class] = GuidelimeData.questRewardList[class] or {}
	GuidelimeDataChar.questRewardList = GuidelimeDataChar.questRewardList or {}
	
	--GuidelimeZarantData = GuidelimeData
	--GuidelimeZarantDataChar = GuidelimeDataChar
end


GuidelimeData.moveTicker = nil
GuidelimeData.Merchant = false

function z.UpdateTrainerData()
	--if #GuidelimeDataChar.trainerData > 0 then
		GuidelimeData.trainerData[class] = GuidelimeDataChar.trainerData
	--end
end

function z.UpdateQuestRewardList()
	if GuidelimeDataChar.questRewardList then
		GuidelimeData.questRewardList[class] = GuidelimeDataChar.questRewardList
	end
end


z.foodList = {
	{
		[1] = {433,5004,7737},
		[5] = {434,2639,5005},
		[15] = {435,5006,24869},
		[25] = {1127,5007,18229,18230,18231,18232,18233,26472,26474},
		[35] = {1129,10256,29008},
		[45] = {1131},
	},
	{
		[1] = {430},
		[5] = {431},
		[15] = {432},
		[25] = {1133},
		[35] = {1135},
		[45] = {1137},
	},
}

z.projectileList = {
	[1] = {
		[2512] = 1, --rough
		[2515] = 10, --sharp
		[3030] = 25, --razor
		[3464] = 91, --desolace quest
		[9399] = 935, --uldaman
		[11285] = 40, --jagged
		[12654] = 954, --doomshot
		[18042] = 952, --thorium
		[19316] = 951, --AV
	},
	[2] = {
		[2516] = 1, --light
		[4960] = 99,
		[8067] = 99,
		[2519] = 10, --heavy
		[5568] = 99,
		[8068] = 99,
		[3033] = 25, --solid
		[3034] = 99,
		[8069] = 99,
		[3465] = 99,
		[10512] = 99,
		[11284] = 40, --accurate
		[10513] = 99,
		[11630] = 99,
		[19317] = 99,
		[15997] = 99,
		[13377] = 99,
	},
}

