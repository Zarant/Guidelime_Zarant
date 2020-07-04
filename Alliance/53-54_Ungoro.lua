
Guidelime.registerGuide([[
[N53-54Un'Goro Crater]
[NX54-55Felwood/Winterspring]
[GA Alliance]
[D Alliance Leveling Guide]
Turn in [QT5158] \\Accept [QA5159] 
Accept [QA4502]
[QC3444-]Loot the small chest outside the metal hut

[V][O]Withdraw the follwing items:\\Torwa's Pouch\\Webbed Diemetradon Scale\\Webbed Pterrordax Scale\\Dinosaur Bone --BANKFRAME_OPENED,BAG_UPDATE>>BankW1_Ungoro53
--[G52.51,27.91Tanaris]Set your HS to [S Gadgetzan]
--Accept [QA4504]--Super sticky tar, do that quest later due to quest log constraints
Turn in [QT2641]
Turn in [QT4493] \\Accept [QA4496]
Accept [QA2661]
Turn in [QT2661] \\Accept [QA2662] \\Turn in [QT2662]

Turn in [QT3444] --stonecricle
Fly to [F Un'Goro]
Accept [QA3881] \\Accept [QA3883] \\Accept [QA3882]
Turn in [QA4284-][QT4284]
Accept [QA4285] \\Accept [QA4288] \\Accept [QA4287]
Click on the Wanted Poster\\Accept [QA4501]
Accept [QA4492]
Accept [QA4503]
[QC4503-][O][QC3882-][O]Kill dinos as you quest through Un'Goro
--Do [QC4504]
[G56.81,9.20,50Un'Goro Crater]Start working on [QC4501,1][OC]
[QC4285-]Click on the Northern Pylon-->>SkipGossip
Do [QC4289]
[G68.47,36.53][QC3881,1-]Loot the Crate of Foodstuffs
[G77.21,49.85][QC4287-]Right click on the eastern pylon-->>SkipGossip
[G79.95,49.86][QC4292-]Open Torwa's Pouch, set up the threshadon meat and the pheromone mixture and kill Lar'kowi
Turn in [QT4292] \\Turn in [QT4289] \\Accept [QA4301]
[G56.46,90.38][QC4501,1-]Kill Pterrodaxes
[G48.67,85.37][QC3883-]Enter the silithid hive\\Use the scraping vial on the middle of the room
Keep killing bugs until you get a [QC4496,1 Gorishi Scent Gland]
[QC4501,2-][O]Kill any Frenzied Pterrodax you see
[G38.44,66.01][QC3881,2-]Loot the Research Equipment
[G23.84,59.08][QC4288-]Click on the Western Pylon-->>SkipGossip
Accept [QA974]
[QC4502-][OC]Kill fire elementals
[G52.95,42.81,50]Climb the volcano\\[G49.75,45.72][QC974-]Climb to the top of the volcano and use the quest item on the flaming protuberance
Finish off [QC4502]
Turn in [QT974] \\Accept [QA980]
Finish off the following:\\[QC4501] \\[QC4503]
Start the Ringo escort quest\\Turn in [QT4492] \\Accept [QA4491]
[QC4491-]Escort Ringo to Marshal's Refuge\\Turn in [QT4491]
Turn in [QT4501]
Turn in [QT3882]
Turn in [QT3883] \\Turn in [QT3881]
Turn in [QT4285] \\Turn in [QT4287] \\Turn in [QT4288] \\Turn in [QA4321-][QT4321]
Turn in [QT4503]
Accept [QA4243]
Turn in [QT4243]
Do [G68.41,12.47][QC4301]
Turn in [QT4301]
Make sure you have 20 Un'Goro soil before leaving Un'Goro[O]
[H]Hearth to Ratchet
Turn in [QT4502] --volcanic activity
[V][O]Withdraw the following: \\Eridan's vial\\Purified Moonwell Water\\Cenarion beacon\\Moontouched Feathers --BANKFRAME_OPENED,BAG_UPDATE>>BankW2_Ungoro53

--Darn
Fly to [F Teldrassil]
Accept [QA978]
Turn in [QT978] \\Accept [QA979] \\Skip this step if you just got this quest (Moontouched Wildkin)
Run upstairs\\Accept [QA5250]
[L63.8,22.8Darnassus]Do the Darnassus cloth turn ins:\\[QA7792-][O][QT7792-][O]Wool \\[QA7798-][O][QT7798-][O]Silk \\[QA7799-][O][QT7799-][O]Mageweave \\[QA7800-][O][QT7800-][O]Runecloth
Accept [QA1047][O] from the courier that roams darnassus
[G39.19,85.12Darnassus][QC4441-]Use Eridan's Vial at the fountain inside the temple
[V][O]Buy food/water--MERCHANT_SHOW,MERCHANT_CLOSED,PLAYER_MONEY>>Vendor
Accept [G67.38,15.68Darnassus][QA3763]
--Accept [G42.44,7.36Darnarssus][QA8151][O][A Hunter] \\(Sunken Temple class quest)
Turn in [QT3763] \\Accept [QA3764] 
Turn in [QT1047][OC]
Accept [QA6761]
Jump down and turn in [QT3764]
Run upstairs and speak with the Arch Druid\\Accept [QA3781]
Run down to the middle floor, speak with Mathrengyl Bearwalker[OC]
Turn in [QT6761][OC]
Accept [QA6762]  --rabine saturna
Turn in [QT3781] at the middle floor
Fly to [F Felwood]--OnStepCompletion>>LoadNextGuide
]], "Zarant")


if not Guidelime.Zarant then return end

local z = Guidelime.Zarant


function z:BankW1_Ungoro53()  --Torwa's Pouch\\All 4 Power Crystals\\Violet Tragan\\Webbed Diemetradon Scale --BANKFRAME_OPENED,BAG_UPDATE>>BankW_Ungoro53
	--local items = {"Torwa's Pouch","Webbed Diemetradon Scale","Un'Goro Soil","Violet Tragan","Red Power Crystal","Green Power Crystal","Blue Power Crystal","Yellow Power Crystal"}
	local items = {11568,11569,11570,11830,11018,11114,11831}
	if z.IsItemNotInBank(items) then
		z.SkipStep(self)
		return
	end
	
	z.WithdrawItems(items)
end
-- Torwa's pouch and its contents: 11568,11569,11570

--Eridan's vial\\Purified Moonwell Water\\Cenarion beacon\\Moontouched Feathers --BANKFRAME_OPENED,BAG_UPDATE>>BankW2_Ungoro53

function z:BankW2_Ungoro53() 
--	local items = {"Eridan's vial","Purified Moonwell Water","Cenarion beacon","Moontouched Feather"}
	local items = {11682,12906,11511,"Moontouched Feather" }
	if z.IsItemNotInBank(items) then
		z.SkipStep(self)
		return
	end
	
	z.WithdrawItems(items)
end