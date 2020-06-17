
Guidelime.registerGuide([[
[N36-38STV(2)]
[NX38-39Swamp of Sorrows]
[GA Alliance]
[D Alliance Leveling Guide]
[T][O]If you used the unstuck feature to SW, remember to train your level 36 spells
[V][O]Deposit the following items:\\Karnitol's Satchel\\Decrypted Letter\\Letter of Commendation\\Fizzle Brassbolts' Letter\\Buzzard Wing --BANKFRAME_OPENED,BAG_UPDATE>>BankD_STV37
[V][O]Withdraw *Small Brass Key* from your bank (if you have it)\\Make sure you have water breathing pots for this segment --BANKFRAME_OPENED,BAG_UPDATE>>BankW_STV37
[S]Set your HS to Booty Bay[OC]
Turn in [QT1115 The Rumormonger][OC]
Accept [QA189 Bloodscalp Ears] \\Accept [QA601 Water Elementals] \\Accept [QA577 Some Assembly Required] --should have it form the previous segment
[S][O]Make sure to set your HS to Booty Bay\\*OR*\\Set your HS to Duskwood or Westfall if you used the unstuck self service to teleport to SW
Fly to [F Westfall][OC]
Turn in [QT325] \\Accept [QA55]
Do [QC228]\\He patrols around the northern side of the graveyard[O]
Do [QC55]\\Use the off-hand weapon provided to remove his shield
Turn in [QT55]
[A Hunter]Fly to [F Duskwood]-->>ZoneSkip,Duskwood

Run to STV\\Accept [QA574 Special Forces] \\Accept [QA207 Kurzen's Mystery]
Accept [QA200 Bookie Herod][O]
Accept [QA192 Panther Mastery] \\Accept [QA195 Raptor Mastery] \\Accept [QA188 Tiger Mastery]--should have it from the previous segment
Click on the pile of books upstairs \\Turn in [QT200 Bookie Herod] \\Accept [QA328 The Hidden Key]
Turn in [QT328 The Hidden Key] \\Accept [QA329 The Spy Revealed!]
Finish off [QC574 Special Forces]
Do [G48.64,22.95,120Stranglethorn Vale][QC192 Panther Mastery]
[QC577 -]Look for crocs along the river bank[O]
[G38.1,20.5,90Stranglethorn Vale]Do [QC195 Raptor Mastery]
Finish off [QC577]
Do [QC188 Tiger Mastery]
Collect [QC189 Bloodscalp Ears][O] as you go around
[QC207,1 -]Loot the first tablet
[QC207,4 -]Loot the fourth tablet
[QC207,3 -]Loot the third tablet
Finish off [QC189 Bloodscalp Ears]
[XP38-30000 Grind until you are 30k xp off level 38]
Do [QC601 Water Elementals]
[QC207,2-]Loot the second tablet underwater
[O]Collect 9 *Blue Pearls* from the clams around the coral reef--OnStepActivation,BAG_UPDATE>>Collect,4611,9
[A Hunter]Kill Murlocs for [QC1107-]Encrusted Tail Fins
[XP38-18640 Grind until you are 18,600 xp away from level 38]
Kill yourself, spirit rez [OC]
Turn in [QT207 Kurzen's Mystery] \\Accept [QA205 Troll Witchery]
Turn in [QT329 The Spy Revealed!] \\Accept [QA330 Patrol Schedules]
Turn in [QT574 Special Forces] \\Accept [QA202 Colonel Kurzen]
Turn in [QT330 Patrol Schedules] \\Accept [QA331 Report to Doren]
Turn in [QT331 Report to Doren]
Turn in [QT188 Tiger Mastery] \\Turn in [QT195 Raptor Mastery] \\Accept [QA196 Raptor Mastery] \\Turn in [QT192 Panther Mastery] \\Accept [QA193 Panther Mastery]
[H]Use your Hearthstone
[O]Fly to [F Booty Bay]--OnStepActivation,ZONE_CHANGED,ZONE_CHANGED_NEW_AREA,NEW_WMO_CHUNK>>ZoneSkip,Stranglethorn Vale
Turn in [QT1115 The Rumormonger] \\Accept [QA1116 Dream Dust in the Swamp] \\Turn in [QT189 Bloodscalp Ears]
Turn in [QT601 Water Elementals] \\Accept [QA602 Magical Analysis]
Set your HS to [S Booty Bay] if you haven't--OnStepActivation>>BindLocation,Booty Bay
Turn in [QT577 Some Assembly Required]
--Accept [QA628 Excelsior]
[XP38 Make sure you are level 38 before starting the next segment]
Fly to [F Stormwind]--OnStepCompletion>>LoadNextGuide

]], "Zarant")

if not Guidelime.Zarant then return end

local z = Guidelime.Zarant


function z:BankD_STV37() --Leftwitch's Package\\Karnitol's Satchel\\Decrypted Letter\\Letter of Commendation\\Fizzle Brassbolts' Letter\\Buzzard Wing --BANKFRAME_OPENED,BAG_UPDATE>>BankD_STV37
	--local items = {"Leftwitch's Package","Decrypted Letter","Letter of Commendation","Karnitol's Satchel","Fizzle Brassbolts' Letter","Buzzard Wing"}
	
	local items = {6253,3518,5539,6245,5827,3404}
	
	if z.IsItemNotInBags(items) then
		z.SkipStep(self)
		return
	end

	z.DepositItems(items)

end

function z:BankW_STV37() --BANKFRAME_OPENED,BAG_UPDATE>>BankW_STV37
	--local items = {"Small Brass Key","Elixir of Water Breathing"} 
	--local waterBreathing = {5996,18294}
	
	if  z.IsItemNotInBank(2719) and (z.IsItemInBags(5996) or z.IsItemInBags(18294)) then
		z.SkipStep(self)
		return
	end
	
	z.WithdrawItems({2719,5996})
end
