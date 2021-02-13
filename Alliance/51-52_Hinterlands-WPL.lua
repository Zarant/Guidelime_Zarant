if Guidelime.Zarant.faction == "Horde" then
	return
end

--Hinterlands part moved to level 48-49

Guidelime.registerGuide([[
[N51-52WPL]
[NX52-52Felwood]
[GA Alliance]
[D Alliance Leveling Guide]
[V]Withdraw the following items from your bank:\\Super Snapper FX\\Snapshot of Gammerita\\Wildkin Feather--BANKFRAME_OPENED,BAG_UPDATE>>BankW_BL51
[G43.22,31.57Ironforge]Do the Gnomeregan cloth turn ins:\\[QA7807-][O][QT7807Wool][O], [QA7808-][O][QT7808Silk][O], [QA7809-][O][QT7809Mageweave][O]-->>Map,Ironforge
[G43.22,31.57Ironforge]Do the Ironforge cloth turn ins:\\[QA7802-][O][QT7802Wool][O], [QA7803-][O][QT7803Silk][O], [QA7804-][O][QT7804Mageweave][O]
Accept [QA5090 A Call to Arms: The Plaguelands!]-->>Unitscan,COURIER HAMMERFALL
Accept [QA4512 A Little Slime Goes a Long Way]\\
Turn in [QT3182 Proof of Deed] \\Accept [QA3201 At Last!]\\
Turn in [QT3368 Suntara Stones]
Accept [QA3448 Passing the Burden]
[A Warlock][G51.1,6.6Ironforge]Accept [QA8419]
Turn in [QT3448 Passing the Burden] \\Accept [QA3449 Arcane Runes] \\Accept [QA3450 An Easy Pickup]
[G18.1,51.6Ironforge][S]Set your HS to Ironforge
Accept [G70.9,83.6Ironforge][QA8151][A Hunter]
Turn in [QT3450 An Easy Pickup] \\Accept [QA3451 Signal for Pickup] \\Turn in [QT3451 Signal for Pickup]

Fly to [F Loch Modan]-->>Map,Loch Modan
Turn in [QT3201 At Last!]
Fly to [F The Hinterlands]-->>Map,The Hinterlands
Turn in [QT2877] \\Turn in [QT2989]

Fly to [F Western Plaguelands]--OnStepCompletion>>LoadNextGuide

Turn in [QT5090][OC]-->>Map,Western Plaguelands
Accept [QA5092]
Do [G50.8,77.8,120Western Plaguelands][QC5092]
Turn in [QT5092] \\Accept [QA5215]
Turn in [QT5215] \\Accept [QA5216]
[G37.17,56.94Western Plaguelands][QC5216-]Kill the cauldron lord[OC]
Click on the cauldron\\Turn in [QT5216] \\Accept [QA5217]
Talk to Janice Felstone inside the farm house\\Accept [QA5021]
Click on the parcel inside the barn\\Turn in [QT5021] \\Accept [QA5022]
[A Hunter]Grind until you are [XP52-16950 16950 XP away from 52][OC] \\If you are not yet close, do one more cauldron quest to get you where you need to be
[A Hunter]Turn in [QT5217] \\You can death skip to chillwind camp if you are at or close to level 52
[A Druid,Mage,Paladin,Priest,Rogue,Warlock,Warrior]Turn in [QT5217]

[A Hunter]Accept [QA5219][OC]
[A Hunter][G46.2,52.0Western Plaguelands]Kill the cauldron and lord \\Turn in [QT5219][OC] \\Accept [QA5220][OC]
[A Hunter]Turn in [QT5220]\\Skip the Dalson's Tear quest line if you don't need more XP[OC]
[A Hunter][G46.2,52.0Western Plaguelands][XP52-19870 Grind until you are 14300 XP away from level 52]
[H]Hearth to Ironforge if your HS is off cooldown[OC]
Fly to [F Wetlands]--OnStepCompletion>>LoadNextGuide
]], "Zarant")

