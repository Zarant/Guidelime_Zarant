if not Guidelime.Zarant or Guidelime.Zarant.Modules.Data then return end
local z = Guidelime.Zarant
local _, class = UnitClass("player")
Guidelime.Zarant.Modules.Data = true

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

z.map = {
	["Durotar"] = 1411,
	["Mulgore"] = 1412,
	["The Barrens"] = 1413,
	["Alterac Mountains"] = 1416,
	["Arathi Highlands"] = 1417,
	["Badlands"] = 1418,
	["Blasted Lands"] = 1419,
	["Tirisfal Glades"] = 1420,
	["Silverpine Forest"] = 1421,
	["Western Plaguelands"] = 1422,
	["Eastern Plaguelands"] = 1423,
	["Hillsbrad Foothills"] = 1424,
	["The Hinterlands"] = 1425,
	["Dun Morogh"] = 1426,
	["Searing Gorge"] = 1427,
	["Burning Steppes"] = 1428,
	["Elwynn Forest"] = 1429,
	["Deadwind Pass"] = 1430,
	["Duskwood"] = 1431,
	["Loch Modan"] = 1432,
	["Redridge Mountains"] = 1433,
	["Stranglethorn Vale"] = 1434,
	["Swamp of Sorrows"] = 1435,
	["Westfall"] = 1436,
	["Wetlands"] = 1437,
	["Teldrassil"] = 1438,
	["Darkshore"] = 1439,
	["Ashenvale"] = 1440,
	["Thousand Needles"] = 1441,
	["Stonetalon Mountains"] = 1442,
	["Desolace"] = 1443,
	["Feralas"] = 1444,
	["Dustwallow Marsh"] = 1445,
	["Tanaris"] = 1446,
	["Azshara"] = 1447,
	["Felwood"] = 1448,
	["Un'Goro Crater"] = 1449,
	["Moonglade"] = 1450,
	["Silithus"] = 1451,
	["Winterspring"] = 1452,
	["Stormwind City"] = 1453,
	["Orgrimmar"] = 1454,
	["Ironforge"] = 1455,
	["Thunder Bluff"] = 1456,
	["Darnassus"] = 1457,
	["Undercity"] = 1458,
}

z.standingID = {
	["Hated"] = 1,
	["Hostile"] = 2,
	["Unfriendly"] = 3,
	["Neutral"] = 4,
	["Friendly"] = 5,
	["Honored"] = 6,
	["Revered"] = 7,
	["Exalted"] = 8,
}