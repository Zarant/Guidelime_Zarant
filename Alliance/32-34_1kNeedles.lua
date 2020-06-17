
Guidelime.registerGuide([[
[N33-34Thousand Needles]
[NX34-35STV(1)]
[GA Alliance]
[D Alliance Leveling Guide]
Take the boat to Theramore [OC]
Get the [P Theramore] FP
Withdraw your main pet from the stables [O][A Hunter]
Accept [QA1282]
Accept [QA1135 Highperch Venom]
Set your HS to [S Theramore]
Speak with Clerk Lendry\\Turn in [QT1302 James Hyal]
Turn in [QT1264 The Missing Diplomat] \\Accept [QA1265 The Missing Diplomat] \\Turn in [QT1282]
[L66.4,51.5 Dustwallow Marsh]Make sure you have 3x[V]*Soothing Spices*[O]--OnStepActivation,BAG_UPDATE,MERCHANT_SHOW>>SoothingSpices
[G59.72,41.17Dustwallow Marsh][QC1265 -] Head to Sentry Point
Turn in [QT1265 The Missing Diplomat] \\Accept [QA1266 The Missing Diplomat]
Accept [QA1218 Soothing Spices] \\Turn in [QT1218 Soothing Spices]
Click the dirt mound and accept [QA1219 The Orc Report]
Turn in [QT1266 The Missing Diplomat] \\Accept [QA1324 The Missing Diplomat]
[QC1324 Beat Private Hendel] \\Turn in [QT1324 The Missing Diplomat]
Speak with Jaina\\Accept [QA1267 The Missing Diplomat] \\Turn in [QT1267 The Missing Diplomat]
--Accept [QA1177 Hungry!]
Click on the badge on top of a wooden plank, on the black shield hanging on top of the fireplace and on the hoofprint right outside the inn[OC]
Accept [QA1284 Suspicious Hoofprints] \\Accept [QA1253 The Black Shield] \\Accept [QA1252 Lieutenant Paval Reethe]
Run to Thousand Needles \\Click on the book next to the dead dwarf \\Accept [G30.72,24.34,20Thousand Needles][QA1100 Lonebrow's Journal]
[G89.50,45.85Feralas] Get the [P Thalanaar] FP

Turn in [QT1100 Lonebrow's Journal] 
Turn in [QT1059]
Do [QC1135 Highperch Venom]
Talk to Kravel Koalbeard\\Accept [QA1110 Rocket Car Parts] \\Skip the other 2 quests from this quest giver
Talk with the gnome brothers\\Accept [QA1104 Salt Flat Venom] \\Turn in [QT1179 The Brassbolts Brothers] \\Accept [QA1105 Hardened Shells]
Accept [QA1176 Load Lightening]
Accept [QA1175 A Bump in the Road]
[QC1175 -][O] Kill basilisks as you go around
[G58.91,0.27,50Tanaris][QC1110 -][QC1104 -][QC1105 -][QC1176 -] Run counter clockwise around the race track until you complete all quests, make sure to prioritize vultures/scorpids
Turn in [QT1175 A Bump in the Road]
Turn in [QT1176 Load Lightening] \\Accept [QA1178 Goblin Sponsorship]
Turn in [QT1105 Hardened Shells] \\Turn in [QT1104 Salt Flat Venom]
Turn in [QT1110 Rocket Car Parts] \\Accept [QA1111 Wharfmaster Dizzywig] \\Accept [QA5762 Hemet Nesingwary]
[G51.01,29.35Tanaris] Get the [P Tanaris] FP
Hearth to [H Theramore][OC]
Turn in [QT1135 Highperch Venom]
Turn in [QT1219 The Orc Report] \\Accept [QA1220 Captain Vimes]
Turn in [QT1220 Captain Vimes] \\Turn in [QT1252 Lieutenant Paval Reethe] \\Accept [QA1259 Lieutenant Paval Reethe] \\Turn in [QT1253 The Black Shield] \\Accept [QA1319 The Black Shield] \\Turn in [QT1284 Suspicious Hoofprints]
Turn in [QT1259 Lieutenant Paval Reethe] \\Accept [QA1285 Daelin's Men]
Turn in [QT1285 Daelin's Men]
Turn in [QT1319 The Black Shield] \\Accept [QA1320 The Black Shield]
Turn in [QT1320 The Black Shield]
[A Warlock]Fly to [F Ratchet]
[A Druid,Mage,Paladin,Priest,Rogue,Hunter,Warrior][G51.71,14.43,25Dustwallow Marsh]Grind your way northwest towards Ratchet
[V][O]Deposit the following items:\\Farren's Report\\Cleverly Encrypted Letter\\Alterac Granite\\Mirefin Head --BANKFRAME_OPENED,BAG_UPDATE>>Bank_1kN33
[A Druid,Mage,Paladin,Priest,Rogue,Hunter,Warrior]Unstuck to Ratchet once you get to The Barrens[OC]
[A Druid,Mage,Paladin,Priest,Rogue,Hunter,Warrior]Get the [P Ratchet] FP
Turn in [QT1178 Goblin Sponsorship] \\Accept [QA1180 Goblin Sponsorship]
[A Warlock]Turn in [QT4736][OC]
[A Warlock]Turn in [QT4738]
[A Warlock]Turn in [QT1798] \\Accept [QA1758]
Turn in [QT1111 Wharfmaster Dizzywig] \\Accept [QA1112 Parts for Kravel]
[A Druid,Mage,Paladin,Priest,Rogue,Warlock,Warrior]Turn in [QT1039] \\Accept [QA1040]

Take the Boat to Booty Bay--OnStepActivation,ZONE_CHANGED,ZONE_CHANGED_NEW_AREA,NEW_WMO_CHUNK>>ZoneSkip,1413,1

]], "Zarant")


if not Guidelime.Zarant then return end

local z = Guidelime.Zarant


function z:Bank_1kN33() --Farren's Report\\Cleverly Encrypted Letter\\Alterac Granite\\Mirefin Head --BANKFRAME_OPENED,BAG_UPDATE>>Bank_1kN33
	--local items = {"Farren's Report","Cleverly Encrypted Letter","Alterac Granite","Mirefin Head"}
	local items = {3721,3521,4521,5847}
	
	if z.IsItemNotInBags(items) then
		z.SkipStep(self)
		return
	end

	z.DepositItems(items)

end
