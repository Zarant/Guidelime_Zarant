if not Guidelime.Zarant or Guidelime.Zarant.Modules.Data then return end
local z = Guidelime.Zarant
local _, class = UnitClass("player")
Guidelime.Zarant.Modules.Data = true
z.skillList = z.skillList or {}
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

z.faction = UnitFactionGroup("player")


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

local name,addon = ...
if Guidelime.addon then
	addon = Guidelime.addon
end

z.map = addon.mapIDs

if not z.map then
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