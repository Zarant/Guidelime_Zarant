if not Guidelime_Zarant then return end
local z = Guidelime_Zarant
local _, class = UnitClass("player")


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
	if #GuidelimeDataChar.trainerData > 0 then
		GuidelimeData.trainerData[class] = GuidelimeDataChar.trainerData
	end
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



local qr = {
	["HUNTER"] = {
		[456] = 1,
		[457] = 1,
		[459] = 1,
		[916] = 2,
		[3522] = 2,
		[917] = 1,
		[919] = 2,
		[932] = 1,
		[937] = 2,
		[938] = 2,
		[935] = 2,
		[2520] = 2,
		[4681] = 2,
		[982] = 2,
		[4740] = 2,
		[1138] = 1,
		[2139] = 2,
		[5321] = 1,
		[4813] = 3, --fragments within
		[741] = 1,
		[219] = 3,
		[19] = 2,
		[286] = 1,
		[296] = 1,
		[275] = 3,
		[633] = 1,
		[943] = 2,
		[471] = 1,
		[474] = 1,
		[98] = 1,
		[181] = 2,
		[55] = 3,
		[223] = 2,
		[505] = 1,
		[564] = 2,
		[204] = 2,
		[6027] = 2,
		[1440] = 3,
		[5561] = 2,
		[5943] = 1,
		[6134] = 2,
		[331] = 2,
		[1467] = 1,
		[661] = 2,
		[666] = 2,
		[733] = 1,
		[600] = 2,
		[1364] = 2,
		[1137] = 1,
		[1189] = 2,
		[4266] = 2,
		[2821] = 1,
		[8366] = 1,
		[3161] = 2,
		[648] = 1,
		[2767] = 1,
		[836] = 2,
		[2874] = 2,
		[7728] = 1,
		[2972] = 2,
		[8460] = 1,
		[2845] = 2,
		[2942] = 1,
		[4292] = 2,
		[4491] = 3,
		[3882] = 1,
		[4501] = 1,
		[4503] = 1,
		[4301] = 2,
		[8464] = 3,
		[4902] = 1,
		[4971] = 2,
		[5237] = 2,
		[5238] = 2,
		[5121] = 3,
		[4261] = 2,
		[5242] = 2,
		[5385] = 1,
		[8278] = 2,
		[8282] = 1,
		[6845] = 2,
		[4510] = 1,
		[3962] = 1,
	},
}

