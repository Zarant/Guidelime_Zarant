if Guidelime.Zarant.faction == "Horde" then
	return
end

Guidelime.registerGuide([[
[N19-20Redridge Mountains]
[NX20-21Darkshore/Ashenvale]
[D Alternative route for non Hunter classes]
[GA Alliance,Warlock,Warrior,Paladin,Priest,Rogue,Mage,Druid]

[T]Train skills[O]-->>Trainer
Get the [P Stormwind City] flight path if you haven't[OC]
Leave SW\\Climb the tower of Azora\\Accept [QA94][OC]
Head to the Redridge/Elwynn border\\Accept [QA244 Encroaching Gnolls]
Turn in [QT244 Encroaching Gnolls]
Fly to [F Redridge][OC] (if applicable)
Accept [QA246 Assessing the Threat]
[G33.5,48.9Redridge Mountains]Accept [QA20 Blackrock Menace]
[G32.2,48.6Redridge Mountains]Accept [QA125 The Lost Tools]
[G31.0,47.5Redridge Mountains]Accept [QA118 The Price of Shoes]
[G29.8,44.5Redridge Mountains]Accept [QA120 Messenger to Stormwind City]
[G27.7,47.4Redridge Mountains]Accept [QA127 Selling Fish]
[G26.8,44.4Redridge Mountains]Accept [QA129 A Free Lunch]
[G22.7,44.0Redridge Mountains]Accept [QA92 Redridge Goulash]
Accept [QA34 An Unwelcome Guest]
[OC]Kill [QC34-]Bellygrub by kiting him towards the Lakeshire guards
Turn in [QT34] \\If you can't solo Bellygrub, skip this step, you'll have another opportunity to finish it later
[G29.3,53.6Redridge Mountains]Accept [QA3741 Hilary's Necklace]
[G41.5,54.7Redridge Mountains]Collect [QC3741,1-]Hilary's Necklace\\Look for a dirt mound underwater, this quest item has a random spawn location.
Do [QC125]
Turn in [QT125 The Lost Tools]
--Accept [QA89 The Everstill Bridge]
[G29.2,53.6Redridge Mountains]Turn in [QT3741 Hilary's Necklace]
[O]Collect 5 Great Goretusk Snout, Tough Condor Meat, Crisp Spider Meat-->>Collect,2296,5,1080,5,1081,5

[G15.3,71.5Redridge Mountains]Accept [QA244 Encroaching Gnolls]
[G30.7,60.0Redridge Mountains]Turn in [QT244 Encroaching Gnolls]\\
Accept [QA246 Assessing the Threat]
Turn in [QT129 A Free Lunch][OC]
Accept [QA130 Visit the Herbalist][OC]
Do [QC246]
[L56.8,50.86Redridge Mountains][QC127 -][O]Kill murlocs
[O]Save 8 Murloc Fins for later-->>Collect,1468,8
Do [G74.0,79.0,60Redridge Mountains][QC20]
[XP20-6300 Grind until you are 6300 xp away from level 20]
Die on purpose and rez at the graveyard[OC]
Turn in [QT246 Assessing the Threat]
[XP20 If you are not yet level 20, turn in all your redridge quests, you should have 6300 xp worth of quest turn ins]

Fly to [F Stormwind City]
[G25.3,78.5Stormwind City]Accept [QA1716 Devourer of Souls][A Warlock]
[G21.4,55.8Stormwind City]Accept [QA3765 The Corruption Abroad]
[G45.6,38.3Stormwind City]Accept [QA343 Speaking of Fortitude]
[G74.1,7.6Stormwind City]Turn in [QT343 Speaking of Fortitude]\\
Accept [QA344 Brother Paxton]
[G64.2,75.2Stormwind City]Turn in [QT120 Messenger to Stormwind]\\
Accept [QA121 Messenger to Stormwind]
[G49.6,40.4Elwynn Forest]Turn in [QT344 Brother Paxton]\\
Accept [QA345 Ink Supplies]
[G41.8,65.6Elwynn Forest]Turn in [QT118 The Price of Shoes]\\
Accept [QA119 Return to Verner]
[G66.3,62.3Stormwind City]Run back to SW\\Fly to [F Redridge]
[G33.4,48.9Redridge Mountains]Turn in [QT20 Blackrock Menace]
[G32.0,48.8Redridge Mountains]Turn in [QT345 Ink Supplies]\\
Accept [QA347 Rethban Ore]\\
Accept [QA89 The Everstill Bridge]

[G31.0,47.2Redridge Mountains]Turn in [QT119 Return to Verner]\\
Accept [QA122 Underbelly Scales]\\
Accept [QA124 A Baying of Gnolls]
Turn in [QT121]
Turn in [QT127]\\
Accept [QA150 Murloc Poachers]\\
Turn in [QT150 Murloc Poachers]
Turn in [QT92 Redridge Goulash]
[G21.9,46.2Redridge Mountains]Turn in [QT130 Visit the Herbalist]\\
Accept [QA131 Delivering Daffodils]


Do [QC124][O]
Do [QC89][O]
Do [QC347]


Turn in [QT34]
[G26.8,44.3Redridge Mountains]Turn in [QT131 Delivering Daffodils]
[G31.0,47.3Redridge Mountains]Turn in [QT124 A Baying of Gnolls]
[G32.1,48.7Redridge Mountains]Turn in [QT89 The Everstill Bridge]
Do [QC122]
[A Dwarf,Gnome,Human]Turn in [QT122]-->>LoadNextGuide
[A NightElf]Turn in [QT122]
[A NightElf]Fly to SW, take the tram to Ironforge and get the [P Ironforge] flight path\\Skip this step if you already have the Ironforge flight path-->>LoadNextGuide
]],"Zarant")

Guidelime.registerGuide([[
[N20-21Darkshore/Ashenvale]
[NX21-23Stonetalon/Ashenvale]
[D Alternative route for Dwarves/Gnomes/Humans]
[GA Alliance,Warlock,Warrior,Paladin,Priest,Rogue,Mage,Druid]
[H][O]Hearth back to Auberdine-->>ZoneSkip,Darkshore


Accept [QA729 The Absent Minded Prospector]
Accept [QA948]
Accept [QA4740]
Accept [QA993]
Kill [QC1003 -][O]Grizzled Thistle Bears
[G27,55.59Felwood][QT952 Grove of the Ancients][A NightElf][OC]
[G27,55.59Felwood]Turn in [QT948 Onu] \\Accept [QA944 The Master's Glaive]
[G22.36,3.98Ashenvale][QC944 Enter The Master's Glaive] and clear mobs around the altar in the center
[L22.36,3.98Ashenvale]Start the escort quest\\Accept [QA945 Therylune's Escape][O]
Drop the scrying bowl on the ground \\Turn in [QT944 The Master's Glaive] \\Accept [QA949 The Twilight Camp]
[G22.24,2.52Ashenvale]Click on the book on top of the pedestal \\Turn in [QT949 The Twilight Camp] \\Accept[QA950 Return to Onu]

[G18.08,64.03Felwood]Turn in [QT729 The Absent Minded Prospector] pt.1 
Start the escort quest\\Accept [QA731 The Absent Minded Prospector] pt.2 
[QC731-]Escort Prospector Remtravel
[G13.97,4.1Ashenvale]Accept [QA4733 Beached Sea Creature]
[G13.93,2.01Ashenvale]Accept [QA4732 Beached Sea Turtle]
[G13.47,64.01Felwood]Accept [QA4731 Beached Sea Turtle]
[G14.62,60.72Felwood]Accept [QA4730 Beached Sea Creature]
[G36.64,76.53,20Darkshore]Clear the murloc camp, maintain a safe distance while doing it\\Move to the center of the camp to summon [QC4740 Murkdeep]
Turn in [G24.53,60.46Felwood][QT1003 Buzzbox 525]
Turn in [QT993 A Lost Master] \\Accept [QA995]
[QC995 -]Wait until the RP sequence is over
[QC994 Escort Volcor]
[G27,55.59Felwood]Turn in [QT951 Mathystra Relics][O]\\Abandon this quest if you haven't completed this quest earlier
[G27,55.59Felwood]Turn in [QT950 Return to Onu]
[G27.96,55.76Felwood]Accept [QA5321 The Sleeper Has Awakened] 
[QC5321,1-]Loot the chest next to the quest giver

Head to ashenvale[OC]
[G27.26,35.58Ashenvale]Turn in [QT5321 The Sleeper Has Awakened]
[G26.43,38.59Ashenvale][QA1010 Bathran's Hair][O]
[G26.19,38.69Ashenvale]Turn in [QT967 The Tower of Althalaxx] pt.3 \\Accept [QA970 The Tower of Althalaxx] pt.4
[G31.41,30.66,145Ashenvale][QC970-]Kill cultists[OC]
[G26.19,38.69Ashenvale]Turn in [QT970 The Tower of Althalaxx] pt.4[OC]
Grind to level [XP20]
[G26.43,38.59Ashenvale][QA1010 Bathran's Hair]
[G31.63,22.33,114Ashenvale][QC1010-]Look out for the herb sacks on the ground
[G31.41,30.66,145Ashenvale][QC970-]Kill cultists
[G26.43,38.59,25Ashenvale]Turn in [QT1010 Bathran's Hair] \\Accept [QA1020 Orendil's Cure]\\
Turn in [QT970 The Tower of Althalaxx] pt.4 \\Accept [QA973 The Tower of Althalaxx] pt.5 --[G26.19,38.69Ashenvale]


[G34.4,48Ashenvale]Get the [P Astranaar] Flight Path 
Accept [G34.67,48.83Ashenvale][QA1008 The Zoram Strand] 
Accept [G34.89,49.79Ashenvale][QA1070 On Guard in Stonetalon]
Accept [G35.76,49.1Ashenvale][QA1056 Journey to Stonetalon Peak]
Accept [G36.61,49.58Ashenvale][QA991 Raene's Cleansing]\\Accept [QA1054]
[G37.36,51.79Ashenvale]Turn in [QT1020 Orendil's Cure]-->>LoadNextGuide

]],"Zarant")

Guidelime.registerGuide([[
[N21-23Stonetalon/Ashenvale]
[NX23-23Wetlands]
[D Alternative route for Dwarves/Gnomes/Humans]
[GA Alliance,Warlock,Warrior,Paladin,Priest,Rogue,Mage,Druid]

Accept [QA1033 Elune's Tear]

[G46.37,46.38,50Ashenvale][QC1033 -]Loot the pearl shaped objects \\Be careful with mobs sneaking underwater
[G37.36,51.79Ashenvale]Turn in [QT1033 Elune's Tear]\\Wait for the RP sequence to end\\Accept [QA1034 The Ruins of Stardust]
[G33.3,67.79,101Ashenvale][QC1034 -]Loot the bushes around the lake
[G31.67,64.24Ashenvale]Head to the base of the mountain\\[G31.21,61.60Ashenvale]Run straight north while climbing the mountain
[G27.50,60.76,5Ashenvale]Climb the hill next to the big tree to the right of the Fire Scar Shrine entrance \\Jump over the tree root and hug the right to avoid aggroing mobs\\[G25.27,60.68Ashenvale][QC973 -]Kill Ilkrud Magthrull
[G22.64,51.91Ashenvale]Turn in [QT945 Therylune's Escape]
[G26.19,38.69Ashenvale]Turn in [QT973 The Tower of Althalaxx] pt.5
Accept [G14.79,31.29Ashenvale][QA1007 The Ancient Statuette]
[QC1008-]Kill nagas[O]
[G14.2,20.64Ashenvale]Loot [QC1007 The Ancient Statuette]
[G14.79,31.29Ashenvale]Turn in [QT1007 The Ancient Statuette] \\Wait for the RP sequence\\Accept [QA1009 Ruuzel]
[G7.4,13.4Ashenvale]Kill [QC1009 Ruuzel] \\Lady Vespia (rare) can also drop the ring
Finish off [QC1008 The Zoram Strand]
Turn in [QT1009]
[G20.31,42.33Ashenvale]Turn in [QT991 Raene's Cleansing] \\Accept [QA1023 Raene's Cleansing] 
Kill Murlocs until the [QC1023 Glowing Gem] drops
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Die at the east side of the lake and spirit rez
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Turn in [G37.36,51.79Ashenvale][QT1034 The Ruins of Stardust]
[A Warrior,Paladin,Priest,Rogue,Mage,Druid][S]Set your HS to Astranaar
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Turn in [G36.61,49.58Ashenvale][QT1023 Raene's Cleansing]\\Accept [QA1025]
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Throw away *Teronis' Journal*[O]-->>Destroy,5505
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Turn in [QT1008 The Zoram Strand]\\Accept [QA1134]
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Fly to [F Darkshore][OC]
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Turn in  [QT4730 Beached Sea Creature]\\
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Turn in  [QT4731 Beached Sea Turtle]\\
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Turn in  [QT4732 Beached Sea Turtle]\\
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Turn in  [QT4733 Beached Sea Creature]
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Turn in [QT4740]
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Turn in [QT995 Escape Through Stealth]
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Turn in [QT3765]
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Turn in [QT731 The Absent Minded Prospector] pt.2 \\Accept [QA741 The Absent Minded Prospector] pt.3
[A NightElf]Fly to [F Teldrassil][OC]
[A Dwarf,Gnome,Human,Warrior,Paladin,Priest,Rogue,Mage,Druid]Take the boat to Darnassus[OC]
[A Dwarf,Gnome,Human,Warrior,Paladin,Priest,Rogue,Mage,Druid][G58.39,94.01Teldrassil]Get the [P Ruth'theran Village] FP[OC]
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Turn in [QT741 The Absent Minded Prospector] pt.3 \\Accept [QA942 The Absent Minded Prospector] pt.4
[A Warrior,Paladin,Priest,Rogue,Mage,Druid][H]Hearth back to Astranaar

[A Warlock]Head back to Astranaar\\Turn in [QT1008 The Zoram Strand]\\Accept [QA1134]
[A Warlock]Turn in [G36.61,49.58Ashenvale][QT1023 Raene's Cleansing]\\Accept [QA1025]
[A Warlock]Throw away *Teronis' Journal*[O]-->>Destroy,5505
[A Warlock]Turn in [G37.36,51.79Ashenvale][QT1034 The Ruins of Stardust]

[G42.5,71.7,50Ashenvale]Head to stonetalon
Turn in [QT1070 On Guard in Stonetalon] \\Accept [QA1085 On Guard in Stonetalon]
Turn in [QT1085 On Guard in Stonetalon] \\Accept [QA1071 A Gnome's Respite]
Accept [QA1093 Super Reaper 6000]
Do [QC1093 Super Reaper 6000]
Do [QC1071 A Gnome's Respite]
Turn in [G22.28,10.86The Barrens][QT1093 Super Reaper 6000]
[A Warlock]Accept [QA1094]
Turn in [QT1071 A Gnome's Respite] \\Accept [QA1072 An Old Colleague] \\Accept [QA1075 A Scroll from Mauren]
Do [QC1134]
Turn in [QT1056 Journey to Stonetalon Peak]
Get the [P Stonetalon Peak] Flight Path
[A Warlock][OC]Sell your junk items and make sure you have at least 4 soul shards before killing yourself
[A Warlock]Die on purpose and rez at the graveyard\\[G35.1,27.8,150The Barrens]Run to The Barrens
[A Warlock][G50.8,35.6,120The Barrens]Once you get to The Barrens, die and rez at the Crossroads GY\\ \\[G49.3,48.2,30The Barrens]Run south and once the zone text change to *Southern Barrens*, die one more time and rez at Camp Taurajo
[A Warlock]Once the zone text change to *Southern Barrens*, death skip to Camp Taurajo\\Turn in [QT1716]\\Accept [QA1738]
[A Warlock][G56.6,51.6,30The Barrens]Run northeast and once the zone text changes to *Raptor Grounds* death skip back to Ratchet\\Do your best to avoid the quilboar mobs
[A Warlock]Once the zone text changes to *Raptor Grounds* or *Northwatch Hold* death skip back to Ratchet\\Turn in [QT1094]
[A Warlock][G63.0,37.2The Barrens]Get the [P Ratchet] FP
[A Warlock][H]Hearth back to Darkshore[OC]
[A Warlock]Turn in  [QT4730 Beached Sea Creature]\\
[A Warlock]Turn in  [QT4731 Beached Sea Turtle]\\
[A Warlock]Turn in  [QT4732 Beached Sea Turtle]\\
[A Warlock]Turn in  [QT4733 Beached Sea Creature]
[A Warlock]Turn in [QT4740]
[A Warlock]Turn in [QT995 Escape Through Stealth]
[A Warlock]Turn in [QT3765]
[A Warlock]Turn in [QT731 The Absent Minded Prospector] pt.2 \\Accept [QA741 The Absent Minded Prospector] pt.3
[A Warlock]Take the boat to Darnassus[OC]
[A Warlock]Turn in [QT741 The Absent Minded Prospector] pt.3 \\Accept [QA942 The Absent Minded Prospector] pt.4
[A Warlock][G58.39,94.01Teldrassil]Get the [P Ruth'theran Village] FP[OC]
Fly to [F Ashenvale]

Turn in [QT1134 Pridewings of Stonetalon]
Accept [QA1025 An Aggressive Defense]
Accept [QA1035]--Fallen Sky Lake

Accept [G49.79,67.21,20Ashenvale][QA1016 Elemental Bracers]
[OC]Loot 5 *Intact Elemental Bracers*-->>Collect,12220,5
[QC1016 -]Right click the *Divining Scroll*
Turn in [G49.79,67.21,20Ashenvale][QT1016 Elemental Bracers]
Do [G54.05,62.83,144Ashenvale][QC1025 An Aggressive Defense]
Run east to Azshara[OC]
Do [QC1035]\\This quest requires you to kill a level 30 mob, skip it if necessary
--Turn in [QT4581]
[G11.90,77.57Azshara]Get the [P Azshara] flight path[OC]
Fly to [F Astranaar]
[G39.54,36.47Ashenvale]Kill [QC1054-]Dal Bloodclaw-->>Unitscan,DAL BLOODCLAW
[A Warrior,Paladin,Priest,Rogue,Mage,Druid]Die and resurrect at Astranaar[OC]
[A Warlock][G31.5,31.5Ashenvale]Do [QC1738]
[A Warlock]Run east and die back to Astranaar[O]-->>ZoneSkip,Darkshore
Turn in [QT1035]
Turn in [QT1025 An Aggressive Defense]
Turn in [QT1054 Culling the Threat]
Fly to [F Auberdine]
[OC]Level first aid/cooking while waiting for the Menethil boat
[G33.70,42.45Darkshore]Take the boat to Menethil Harbor--OnStepCompletion>>LoadNextGuide


]],"Zarant")