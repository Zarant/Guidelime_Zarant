
Guidelime.registerGuide([[
[N23-24Wetlands]
[GA Alliance]
[D Alliance Hunter Leveling Guide]
[NX24-25Stormwind/Duskwood]
Accept [G8.54,55.73Wetlands][QA484 Young Crocolisk Skins]
Accept [G8.3,58.53Wetlands][QA279 Claws from the Deep]
Get the [P Wetlands] FP [A NightElf] --<<<<<
Accept [G10.89,59.66Wetlands][QA288 The Third Fleet] \\Accept [QA463 The Greenwarden]
[G10.7,60.95Wetlands][QC288 Buy a flagon of mead from the innkeeper]
[G10.84,60.43Wetlands]Go upstairs, turn in [QT942 The Absent Minded Prospector], skip the follow up
Turn in [G10.89,59.66Wetlands][QT288 The Third Fleet]
[G10.75,56.75Wetlands]Look for a [V]*Bronze Tube* at the npc inside the keep[O]--OnStepActivation,BAG_UPDATE>>BronzeTube
Kill [QC484 Young Wetlands Crocolisks][O]
Do [G18.06,39.83Wetlands][QC279 Claws from the Deep]
[G26.4,25.76Wetlands]Look for a [V]*Bronze Tube* at the gnome npc--OnStepActivation,BAG_UPDATE>>BronzeTube
Accept [G49.91,39.36Wetlands][QA469 Daily Delivery]
[G56.37,40.4Wetlands]Turn in [QT463 The Greenwarden][OC]
Accept [QA276 Tramping Paws]
Do [G61.91,71.32,168Wetlands][QC276 Tramping Paws]
[XP24 Grind to level 24]
[G56.37,40.4Wetlands]Turn in [QT276 Tramping Paws] \\Accept [QA277 Fire Taboo]
[G54.5,72.3,80Wetlands] Head to Loch Modan \\*OR*\\Use the website unstuck feature and skip the rest of this segment if you already have the Loch Modan FP--OnStepActivation,ZONE_CHANGED,ZONE_CHANGED_NEW_AREA,NEW_WMO_CHUNK>>ZoneSkip,Stormwind City,1


Accept [G46.04,13.61Loch Modan][QA250 A Dark Threat Looms]
[G56.05,13.23Loch Modan]Click on the [QT250 Suspicious Barrel] \\Accept [QA199 A Dark Threat Looms] pt.2
[G46.04,13.61Loch Modan]Turn in [QT199 A Dark Threat Looms pt.2] \\Skip the follow up
Throw away your HS and unstuck to Thelsamar[OC]

Accept [G34.26,47.7Loch Modan][QA467 Stonegear's Search][A NightElf][O]
[G33.93,50.95Loch Modan] Get the [P Thelsamar] Flight Path[A NightElf,Human]
[O]From this point forward you will save about 10-15 minutes using the website unstuck to teleport to SW and skipping the rest of this segment--OnStepActivation,ZONE_CHANGED,ZONE_CHANGED_NEW_AREA,NEW_WMO_CHUNK>>ZoneSkip,1453,1
[G21.3,68.6,50Loch Modan] Run to Dun Morogh[A NightElf]
Once you get to Dun Morogh, throw away your HS and unstuck [OC][A NightElf]
Turn in [G49.62,48.61Dun Morogh][QT467 Stonegear's Search][A NightElf]
[A NightElf][O][G50.08,49.42,8Dun Morogh] Buy a [V]*Bronze Tube* if you haven't already--OnStepActivation,BAG_UPDATE>>BronzeTube
[G14.9,87.1,50Ironforge] Run to Ironforge[A NightElf]
Fly to [F Ironforge][A Dwarf,Gnome,Human]


[G50.82,5.61Ironforge]Turn in [QT968 The Powers Below] if you have it[O]
[G72.08,51.87Ironforge]Turn in [QT1072 An Old Colleague][O] (optional, you can turn it in later)
[G67.84,42.5Ironforge]Buy a [V]*Bronze Tube* if you haven't already[O]--OnStepActivation,BAG_UPDATE>>BronzeTube
Take the tram to Stormwind--OnStepActivation,ZONE_CHANGED,ZONE_CHANGED_NEW_AREA,NEW_WMO_CHUNK>>ZoneSkip,1453,1

]], "Zarant")

if not Guidelime_Zarant then return end


function Guidelime_Zarant:BronzeTube(args)
	reverseLogic = unpack(args)
	if not reverseLogic == (IsQuestFlaggedCompleted(174) or GetItemCount(4371) > 0) then
		self:SkipStep()
	end
end