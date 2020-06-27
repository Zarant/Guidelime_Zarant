
Guidelime.registerGuide([[
[N38-39Swamp of Sorrows]
[NX39-40Alterac/Arathi]
[GA Alliance]
[D Alliance Leveling Guide]

Fly to Stormwind[OC]
Accept [QA1448 In Search of The Temple]
[A Hunter]Accept [QA1363 Mazen's Behest] pt.1\\Run upstairs and turn in [QT1363 Mazen's Behest] pt.1\\Accept [QA1364 Mazen's Behest] pt.2
Accept [QA1260 Morgan Stern]
Make sure you bank 15 Silk Cloth for later [OC]
Fly to [F Duskwood]
Turn in [QT228] \\Accept [QA229]
Turn in [QT229]
--Turn in [QT1477] \\Accept [QA1395]
[G6.59,60.19,90Swamp of Sorrows]Run to Swamp of Sorrows
[G13.96,61.67,166Swamp of Sorrows][QC1116-]Start by grinding whelps \\You won't find enough whelps to finish this quest in 1 pass [OC]
Accept [QA1396 Encroaching Wildlife]
[QC1364-]Kill all swamp creatures you see, don't go out of the way to complete it[O]
Do [QC1396 Encroaching Wildlife] as you go along [O]
Kill Noboru, click the quest item \\Accept [G47.1,38.83,20Swamp of Sorrows][QA1392 Noboru the Cudgel]
Accept [QA1389 Draenethyst Crystals] \\Turn in [QT1392 Noboru the Cudgel]
[G14.97,37.31,70Swamp of Sorrows]Kill some swamp elementals
Finish off [QC1116]
Finish off [QC1396 Encroaching Wildlife]
Turn in [QT1396 Encroaching Wildlife] \\Accept [QA1421 The Lost Caravan]
[QC1373-][O]Kill Ongeku
[QC1389-][O]Loot 6 blue crystals around the wooden huts
[QC1421-]Loot the chest on top of the broken cart
Accept [QA1393 Galen's Escape] \\Escort Galen
[QC1393-]Escort Galen
Finish off [QC1389]
Click on Galen's Strongbox \\Turn in [QT1393 Galen's Escape]
Turn in [QT1389 Draenethyst Crystals]
--[G14.97,37.31,70Swamp of Sorrows]Finish off [QC1364 Mazen's Behest]
If you haven't done Mazen's Behest yet, skip it and do it some time later\\Do NOT abandon the associated quest[OC]
Turn in [QT1421 The Lost Caravan]
Do [G67.0,47.0 Swamp of Sorrows][QC1448 In Search of The Temple] by swimming to the middle of the lake
Grind mobs until your HS is off cooldown \\[H]Hearth to Booty Bay
Turn in [QT1116] \\Accept [QA1117]

Fly to [F Stormwind]

[V][O]Withdraw the following items:\\Water Breathing Potions\\Decrypted Letter\\Letter of Commendation\\Karnitol's Satchel\\Bag of Water Elemental Bracers\\Encrusted Tail Fins\\Mirefin Head --BANKFRAME_OPENED,BAG_UPDATE>>BankW_Swamp38
[V][O]Deposit the following items in your bank:\\Blue Pearls\\Khadgar's Essays on Dimensional Convergence (if you have it) --BANKFRAME_OPENED,BAG_UPDATE>>BankD_Swamp38
Accept [QA543 The Perenolde Tiara]
Turn in [QT1448 In Search of The Temple] \\Accept [QA1449]
Take the tram to IF [OC]
Turn in [QT1457 The Karnitol Shipwreck] 
--Turn in [QT1467 Reagents for Reclaimers Inc.]
Make sure you have water breathing pots for the next segment [OC]
Fly to [F Southshore]--OnStepCompletion>>LoadNextGuide

]], "Zarant")

if not Guidelime.Zarant then return end

local z = Guidelime.Zarant


function z:BankD_Swamp38() --BANKFRAME_OPENED,BAG_UPDATE>>BankD_Swamp38
	--local items = {"Khadgar's Essays on Dimensional Convergence","Blue Pearl"} 
	local items = {6065,4611}
	if z.IsItemNotInBags(items) then
		z.SkipStep(self)
		return
	end

	z.DepositItems(items)

end

--"Leftwitch's Package","Decrypted Letter","Letter of Commendation","Karnitol's Satchel","Fizzle Brassbolts' Letter","Bag of Water Elemental Bracers","Encrusted Tail Fin","Elixir of Water Breathing","Mirefin Head"
function z:BankW_Swamp38() --BANKFRAME_OPENED,BAG_UPDATE>>BankW_Swamp38
--	local items = {"Leftwitch's Package","Decrypted Letter","Letter of Commendation","Karnitol's Satchel","Bag of Water Elemental Bracers","Encrusted Tail Fin","Mirefin Head"}

	
	local items = {6253,3518,5539,6245,3960,5796,5847}
	
	if  z.IsItemNotInBank(items) and (z.IsItemInBags(5996) or z.IsItemInBags(18294)) then
		z.SkipStep(self)
		return
	end
	table.insert(items,5996)
	z.WithdrawItems(items)
end