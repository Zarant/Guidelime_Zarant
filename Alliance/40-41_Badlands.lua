
Guidelime.registerGuide([[
[N40-41Badlands]
[NX41-43STV/Swamp of Sorrows]
[GA Alliance]
[D Alliance Leveling Guide]
[A Warlock]If you used the unstuck service to teleport to SW, turn in the following quests:\\[QT543] \\[QT542] \\ \\If you had to fly to IF, abandon Raptor/Panther Mastery and skip this step
[T]Train skills\\Train pet skills[O]
[V][O]Deposit the following items:\\Seaforium Booster\\Perenolde Tiara\\Tomes of Alterac\\Kravel's Scheme\\Sample Elven Gem --BANKFRAME_OPENED,BAG_UPDATE>>BankD_Badlands40
[V][O]Withdraw the following items from your bank:\\Blue Pearls (x9)\\Buzzard Wings\\Fizzle Brassbolts' Letter --BANKFRAME_OPENED,BAG_UPDATE>>BankW_Badlands40

Head to Ironforge[OC]
Turn in [QT1467 Reagents for Reclaimers Inc.]
Accept [QA707 Ironband Wants You!] \\Turn in [QT554 Stormpike's Deciphering]
Turn in [QT653 Myzrael's Allies] \\Accept [QA687 Theldurin the Lost]
Fly to [F Loch Modan]
[A Hunter][S]Set your HS to Loch Modan
Accept [QA2500 Badlands Reagent Run]
Turn in [QT707 Ironband Wants You!] \\Accept [QA738 Find Agmond]
[QC2500,1-][O][QC2500,2-][O]Kill wolves/vultures as you quest through Badlands \\Make sure to prioritize vultures
[A Warlock]Click on the crumpled map next to the tent\\Accept [QA720 A Sign of Hope]--Quest Log space issues
[A Warlock]Turn in [QT720]
Accept [QA719 A Dwarf and His Tools] \\Accept [QA718 Mirages]
Click on the crumpled map next to the tent\\Accept [QA720 A Sign of Hope]
[QC719-]Kill Shadowforge dwarves
[QC718-]Loot the crate at the ogre camp
Turn in [QT718 Mirages] \\Accept [QA733 Scrounging] \\Turn in [QT719 A Dwarf and His Tools] \\Turn in [QT720 A Sign of Hope]
Turn in [QT1106 Martek the Exiled] \\Accept [QA1108 Indurium]
Accept/Turn in [QA705-][O][QT705 Pearl Diving][O] \\Skip this step if you don't have 9 blue pearls
Accept [QA703 Barbecued Buzzard Wings]
Do [QT703][O]
Accept [QA732 Tremors of the Earth]
[QC732-]Look for Boss Tho'grun as you quest [O]
Turn in [QT738 Find Agmond] \\Accept [QA739 Murdaloc]
[QC1108-][O]Kill Troggs
Do [QC739 Murdaloc]
Turn in [QT687 Theldurin the Lost] \\Accept [QA692 The Lost Fragments]
Do [QC692 The Lost Fragments]
Turn in [QT692 The Lost Fragments]
Turn in [QT1108 Indurium] \\Grind mobs while you watch the RP sequence\\Accept [QA1137 News for Fizzle]
Accept [QA710 Study of the Elements: Rock]
Do [QC710 Study of the Elements: Rock]
Turn in [QT710 Study of the Elements: Rock] \\Accept [QA711 Study of the Elements: Rock]
Do [G14.7,35.3,30Badlands][QC711 Study of the Elements: Rock] 
Turn in [QT711 Study of the Elements: Rock]\\Accept [QA712 Study of the Elements: Rock]
[G16.12,60.47,50Badlands][QC2500,1-][QC703-]Finish off Vultures
Do [QC712 Study of the Elements: Rock]
[QC733-]Kill Ogres
Turn in [QT712 Study of the Elements: Rock]
Turn in [QT703 Barbecued Buzzard Wings]
Turn in [QT733 Scrounging]
Turn in [QT732 Tremors of the Earth]
Run to Searing Gorge [OC]
[A Hunter]Once you get to Searing Gorge, suicide and spirit rez at Thorium Point\\Get the [P Searing Gorge] FP
[A Hunter][H]Hearth back to Loch Modan
[A Druid,Mage,Paladin,Priest,Rogue,Warlock,Warrior]Once you get to Searing Gorge, throw away your HS, unstuck and spirit rez at Thorium Point\\[G37.8,30.6Searing Gorge]Fly to [F Loch Modan]
Turn in [QT2500 Badlands Reagent Run]
Turn in [QT739 Murdaloc]
Unstuck back to Thelsamar [OC]
Fly to [F Ironforge]--OnStepCompletion>>LoadNextGuide
]], "Zarant")

if not Guidelime.Zarant then return end

local z = Guidelime.Zarant


function z:BankD_Badlands40() --Seaforium Booster\\Perenolde Tiara\\Tomes of Alterac\\Kravel's Scheme\\Sample Elven Gem --BANKFRAME_OPENED,BAG_UPDATE>>BankD_Badlands40
	--local items = {"Seaforium Booster","Perenolde Tiara","Tomes of Alterac","Kravel's Scheme","Sample Elven Gem"} 
	local items = {5862,3684,3660,5826,4502}
	if z.IsItemNotInBags(items) then
		z.SkipStep(self)
		return
	end

	z.DepositItems(items)

end

function z:BankW_Badlands40()
	--local items = {"Blue Pearl","Buzzard Wing","Fizzle Brassbolts' Letter"}
	local items = {4611,3404,5827}
	if z.IsItemNotInBank(items) then
		z.SkipStep(self)
		return
	end
	
	z.WithdrawItems(items)
end