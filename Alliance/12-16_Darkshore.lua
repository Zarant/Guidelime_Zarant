if Guidelime.Zarant.faction == "Horde" then
	return
end

Guidelime.registerGuide([[
[N11-19Darkshore part 1]
[NX11-19Darkshore part 2]
[GA NightElf,Dwarf,Druid,Hunter,Priest,Rogue,Warrior]
[D Night Elf Darkshore route]

[G56.25,92.44Teldrassil]Turn in [QT6344 Nessa Shadowsong] \\Accept [QA6341 The Bounty of Teldrassil][A NightElf]
[G58.39,94.01Teldrassil]Turn in [QT6341 The Bounty of Teldrassil] \\Accept [QA6342 Flight to Auberdine][A NightElf]
[F Fly to Darkshore][OC][A NightElf]
[A Dwarf,Human,Gnome][G19.1,20.63Felwood][P Get the Auberdine flight path]
[G19.1,20.63Felwood]Accept [QA3524 Washed Ashore]
[G19.27,19.14Felwood]Turn in [QT6342 Flight to Auberdine][A NightElf] \\Accept [QA6343 Return to Nessa][A NightElf]
[S]SET HEARTHSTONE TO *AUBERDINE*
[G19.51,18.97Felwood]Accept [QA983 Buzzbox 827]
[G21.63,18.15Felwood]Accept [QA2118 Plagued Lands] \\Accept [QA984 How Big a Threat?]
[A Dwarf,Hunter][O]Tame a Thistle Bear, they can stun you, send your pet on them and when they use their stun on your pet, abandon your current pet and start taming it-->>TameBeast,2163
[QC983 Kill crabs along the coast][O]
[G18.81,26.69Felwood][QC3524 Loot the sea creature remains]
[O]Save Strider Meat x5 for later-->>Collect,5469,5
[G22.39,29.45,96Felwood][QC984 Head towards the fulborg camp]
[QC2118-]Capture a rabid thistle bear[O]
[XP12-1500 Grind mobs until you are 1500xp off level 12]

Turn in [G19.13,21.39Felwood][QT983 Buzzbox 827] \\Accept [QA1001 Buzzbox 411]
Turn in [G19.1,20.63Felwood][QT3524 Washed Ashore pt.1] \\Accept [QA4681 Washed Ashore pt.2]

Accept [G18.1,18.48Felwood][QA963 For Love Eternal]
[QC1001 -][O]Start working on darkshore threshers
[G33.70,42.45,20Darkshore]Run up to the docks then jump in the water at the intersection\\
[G13.63,21.44Felwood][QC4681 -]Click on the sea turtle remains
Turn in [G19.1,20.63Felwood][QT4681 Washed Ashore]

[G19.9,18.4Felwood]Accept [QA947 Cave Mushrooms]
[G20.34,18.12Felwood]Accept [QA4811 The Red Crystal]
[G19.98,14.4Felwood][V][O]Buy 6 slot bags\\Make sure you have about 9 stacks of ammo, long grinding session ahead--MERCHANT_SHOW,MERCHANT_CLOSED,BAG_UPDATE>>Darkshore_vendor_1
Turn in [G22.24,18.22Felwood][QT984 How Big a Threat?] pt.1 \\Accept [QA985 How Big a Threat?] pt.2 \\Accept [QA4761 Thundris Windweaver]
[A Dwarf,Gnome,Human]Accept [G20.8,15.58Felwood][QA982 Deep Ocean, Vast Sea]
Turn in [G19.98,14.4Felwood][QT4761 Thundris Windweaver] \\Accept [QA4762 The Cliffspring River] \\Accept [QA958 Tools of the Highborne] \\Accept [QA954 Bashal'Aran]

Run north along the coast killing Threshers[OC]
[A Dwarf,Gnome,Human][G20.94,1.49Felwood][QC982,1-]Enter the 1st ship by the hole on the hull
[A Dwarf,Gnome,Human][G39.63,27.45Darkshore][QC982,2-]Enter the 2nd ship by the hole on the hull
Turn in [G25.19,1.29Felwood][QT1001 Buzzbox 411] \\Accept [QA1002 Buzzbox 323]
[QC1002-]Kill any type of Moonstalker[O]-->>Unitscan,Moonstalker,Moonstalker Runt
[OC] Start collecting small eggs for leveling cooking later\\You will need 10 points in cooking to accept a quest later
Turn in [G27.7,10.03Felwood][QT954 Bashal'Aran] pt.1 \\Accept [QA955 Bashal'Aran] pt.2
[G29.13,12.34,153Felwood][QC955 Kill Imps]
Turn in [G27.7,10.03Felwood][QT955 Bashal'Aran] pt.2 \\Accept [QA956 Bashal'Aran] pt.3
[G29.6,12.52,151Felwood][QC956 Kill satyrs]
Turn in [G27.7,10.03Felwood][QT956 Bashal'Aran] pt.3 \\Accept [QA957 Bashal'Aran] pt.4
[XP13 Grind to level 13]
[O] Make sure you have at least 9 small eggs to level cooking\\Skip this step if you already have 10 points in cooking.
[G31.29,24.14Felwood]Run up to [QC4811 The Red Crystal] in the mountains
[A Mage,Paladin,Priest,Rogue,Warlock,Warrior][H]Hearth to Auberdine[OC]
Turn in [G20.34,18.12Felwood][QT4811 The Red Crystal] \\Accept [QA4812 As Water Cascades]
[G37.78,44.06Darkshore][QC4812-] Fill the *Empty Water Tube* at the moonwell
[A Hunter,Druid]Click on the red crystal\\Turn in [G31.29,24.14Felwood][QT4812 As Water Cascades] \\Accept [QA4813 The Fragments Within]
[A Hunter,Druid][H][OC]Hearth to Auberdine
[A Hunter,Druid]Turn in [G20.34,18.12Felwood][QT4813 The Fragments Within]

[L22.39,29.45Felwood][QC985-][O]Kill fulborgs
[G40.3,59.7Darkshore]Accept [QA953 The Fall of Ameth'Aran]
[QC963 -][O]Kill Anaya Dawnrunner-->>Unitscan,ANAYA DAWNRUNNER
[G25.98,40.62Felwood][QC953,2 The Fall of Ameth'Aran]
[G25.66,39.11Felwood][QC957 Bashal'Aran]
[G26.71,35.53Felwood][QC953,1 The Fall of Ameth'Aran]
Finish off [QC958 Tools of the Highborne]
Turn in [G23.29,36.73Felwood][QT953 The Fall of Ameth'Aran]
[A Druid,Mage,Paladin,Priest,Rogue,Warlock,Warrior][XP15 Grind to level 15]
[A Hunter][G22.39,29.45,96Felwood][XP15.25 Grind to level 15 + 25%]
[A Mage,Paladin,Priest,Rogue,Warlock,Warrior]Click on the red crystal\\Turn in [G31.29,24.14Felwood][QT4812 As Water Cascades] \\Accept [QA4813 The Fragments Within]

Turn in [G21.63,18.15Felwood][QT2118 Plagued Lands] \\Accept [QA2138 Cleansing of the Infected]
Turn in [G22.24,18.22Felwood][QT985 How Big a Threat?] \\Accept [QA986 A Lost Master]
[G21.86,18.3Felwood]Run upstairs \\Accept [QA965 The Tower of Althalaxx] pt.1
[A Mage,Paladin,Priest,Rogue,Warlock,Warrior]Turn in [QT4813]
--[V][O]Buy Level 15 food
Turn in [G18.1,18.48Felwood][QT963 For Love Eternal]
Accept [G18.5,19.87Felwood][QA1138 Fruit of the Sea]

Accept [G20.8,15.58Felwood][QA982 Deep Ocean, Vast Sea]
[G20.8,15.58Felwood]Buy [V]*Mild Spice* and cook herb baked eggs if you don't have 10 points in cooking\\[G37.7,40.7Darkshore]Accept [QA2178]
[A NightElf]Turn in [G19.98,14.4Felwood][QT958 Tools of the Highborne]

Click on the red crystal\\Turn in [G31.29,24.14Felwood][QT4812 As Water Cascades] \\Accept [QA4813 The Fragments Within]
[G20.94,1.49Felwood][QC982,1-]Enter the 1st ship by the hole on the hull
[G39.63,27.45Darkshore][QC982,2-]Enter the 2nd ship by the hole on the hull
Accept [G25.15,4.61Felwood][QA4723 Beached Sea Creature]
Do [QC2138][O]
[G5.49,36.64,144Winterspring]Head to the cave above the waterfall
[QC947,1-]Loot the blue mushrooms on the ground[OC]
[QC947,2-]Once you enter the cave, turn right and look for a yellow mushroom on the ground
Finish off [QC947]
Turn in [G1.42,26.89Winterspring][QT1002 Buzzbox 323] \\Accept [QA1003 Buzzbox 525] \\Skip this step if you don't have enough moonstalker fangs
[G50.81,25.50Darkshore]Use the [QC4762 Empty Sampling Tube] at the base of the waterfall
[G44.18,20.6Darkshore]Kill *Reef Crawlers* for [QC1138 Fine Crab Chunks][OC] 
Accept [G44.18,20.6Darkshore][QA4725 Beached Sea Turtle]
Finish off [QC1138], you can skip this step and finish this quest later if the area is too crowded
[A NightElf]Grind until your HS cooldown is <6 minutes then death warp to Auberdine [OC]
[A Dwarf,Gnome,Human][H][OC]Hearth back to Auberdine
[A Dwarf,Gnome,Human]Accept [G20.04,16.35Felwood][QA729 The Absent Minded Prospector]
[A Dwarf,Gnome,Human]Turn in [G19.98,14.4Felwood][QT958 Tools of the Highborne]
[G19.98,14.4Felwood]Turn in [QT4762 The Cliffspring River] \\Accept [QA4763 The Blackwood Corrupted]
Turn in [G20.8,15.58Felwood][QT982 Deep Ocean, Vast Sea]
Turn in [G20.34,18.12Felwood][QT4813 The Fragments Within]
Turn in [G19.9,18.4Felwood][QT947 Cave Mushrooms] \\Accept [QA948 Onu]
[G19.78,19.07Felwood]Click on the wanted poster outside the inn \\Accept [QA4740 WANTED: Murkdeep!]
[L37.78,44.06Darkshore]Fill the Empty Bowl at the moonwell-->>Collect,12347,1
[G19.1,20.63Felwood]Turn in [QT4723 Beached Sea Creature] \\Turn in [QT4725 Beached Sea Turtle]-->>LoadNextGuide
]], "Zarant")

Guidelime.registerGuide([[
[N11-19Darkshore part 2]
[GA Alliance]
[D Alliance Leveling Guide]
[NX19-21Darkshore/Ashenvale]
[NX19-20Redridge Mountains]

[A NightElf][G19.1,20.63Felwood]Fly to [F Teldrassil]
[A NightElf][G56.25,92.44Teldrassil][QT6343 Return to Nessa]
[A NightElf,Hunter][O][G36.6,13.6,100Darnassus][T]Train skills\\Prioritize immolation trap/wing clip/mend pet\\Try to save 92 silver--TRAINER_SHOW,TRAINER_CLOSED>>Trainer
[A NightElf][L28,49.5Teldrassil][T]Train First Aid[OC]
[A NightElf,Hunter][OC][G63.3,66.3Darnassus][V]Restock/Resupply\\Prioritize buying a level 20 bow\\Buy a level 16 bow if you have money to spare--MERCHANT_SHOW,MERCHANT_CLOSED,BAG_UPDATE>>Darkshore_vendor_2
[A NightElf]Accept [G23.7,64.51Teldrassil][QA730 Trouble In Darkshore?]
[A NightElf][H]Hearth back to Auberdine
[G20.04,16.35Felwood][QT730 Trouble In Darkshore?][OC]
[G20.04,16.35Felwood][QA729 The Absent Minded Prospector]
[G19.78,19.07Felwood]Click on the wanted poster outside the inn \\Accept [QA4740 WANTED: Murkdeep!]
[G19.98,14.4Felwood]Turn in [QT4762 The Cliffspring River] \\Accept [QA4763 The Blackwood Corrupted]
[G37.78,44.06Darkshore]Make sure you filled the Empty Bowl at the moonwell-->>Collect,12347,1
[G18.5,19.87Felwood][QA1138 Fruit of the Sea]
Finish off [QC1002][O]
[G39.99,78.46,40Darkshore]Kill [QC2138Rabid Thistle Bears] as you grind your way south
Kill any [QC986 Moonstalker Sire][O] you find, they share spawns with Grizzled Thistle Bears, don't go out of your way to finish it-->>Unitscan,Moonstalker Sire
[G39.99,78.46,55Darkshore]Grind your way south\\Once you get to the fulborg camp, alternate between grinding fulborgs and killing bears/cats south
[G38.6,80.5,130Darkshore]Kill [QC1003 Grizzled Thistle Bears][OC], keep grinding fulborgs while waiting for respawns--OnStepActivation>>Buzzbox1002
[G27,55.59Felwood]Turn in [QT948 Onu] \\Accept [QA944 The Master's Glaive]
[G27,55.59Felwood][QT952 Grove of the Ancients][A NightElf][OC]
[G22.36,3.98Ashenvale][QC944 Enter The Master's Glaive] and clear mobs around the altar in the center
[G22.36,3.98Ashenvale] Accept [QA945 Therylune's Escape][O]
Drop the scrying bowl on the ground \\Turn in [QT944 The Master's Glaive] \\Accept [QA949 The Twilight Camp]
[G22.24,2.52Ashenvale]Click on the book on top of the pedestal \\Turn in [QT949 The Twilight Camp] \\Accept[QA950 Return to Onu]
[QC945 -]Finish the escort quest

[A Dwarf,Hunter][G18.08,64.03Felwood]Turn in [QT729 The Absent Minded Prospector] pt.1 
[A Dwarf,Hunter]Start the escort quest\\Accept [QA731 The Absent Minded Prospector] pt.2 
[A Dwarf,Hunter][QC731-]Escort Prospector Remtravel

Turn in [G24.53,60.46Felwood][QT1003 Buzzbox 525][OC]--OnStepActivation>>Buzzbox1002
[G27,55.59Felwood]Turn in [QT950 Return to Onu] \\Accept [QA951 Mathystra Relics]
[G39.99,78.46,40Darkshore] Clear the fulborg camp and look for moonstalkers while you do it
Kill crabs along the coast for [QC1138 Fine Crab Chunks], skip this step if the area is too crowded[O]
[G36.64,76.53,20Darkshore]Clear the murloc camp, maintain a safe distance while doing it\\Move to the center of the camp to summon [QC4740 Murkdeep] 
[G18.41,49.43Felwood][QA4728 Beached Sea Creature]
[G19.64,39.52Felwood][QA4722 Beached Sea Turtle]

[G19.1,20.63Felwood]Turn in [QT4728 Beached Sea Creature][O]
Turn in [QT4722 Beached Sea Turtle]
Turn in [G20.34,18.12Felwood][QT4740 WANTED: Murkdeep!]
Turn in [G21.63,18.15Felwood][QT2138 Cleansing of the Infected] \\Accept [QA2139 Tharnariun's Hope]
[A Dwarf,Hunter]Turn in [G20.04,16.35Felwood][QT731 The Absent Minded Prospector] pt.2 \\Accept [QA741 The Absent Minded Prospector] pt.3
[G37.7,40.7Darkshore][V Restock/Resupply]--MERCHANT_SHOW,MERCHANT_CLOSED,PLAYER_MONEY>>Vendor
Turn in [G27.7,10.03Felwood][QT957 Bashal'Aran]
[G50.74,34.68Darkshore]Head to the fulborg camp north, loot the Grain Stores[OC]-->>Collect,12342,1
[G52.46,36.90Darkshore]Cimb the ramp and kill the [QC2139 Den Mother]
Loot the Nut/Fruit Stores and use the bowl to summon [QC4763 Xabraxxis]
[A Druid,Mage,Paladin,Priest,Rogue,Warlock,Warrior][G50.74,74.68Darkshore][XP18 Grind to level 18]
[A Hunter][G50.74,74.68Darkshore]Grind to [XP18.5 18 + 50%] \\Make sure your HS cooldown is <10 min\\Skip this step if the area is too crowded
Turn in [G1.42,26.89Winterspring][QT1002 Buzzbox 323] \\Accept [G1.42,26.89Winterspring][QA1003 Buzzbox 525]--OnStepCompletion>>Buzzbox1002,1
Turn in [G4.82,27.18Winterspring][QT965 The Tower of Althalaxx] pt.1 \\Accept [QA966 The Tower of Althalaxx] pt.2
[G6.06,28.81,154Winterspring][QC966 Kill cultists]
Turn in [G4.82,27.18Winterspring][QT966 The Tower of Althalaxx] pt.2 \\Accept [QA967 The Tower of Althalaxx] pt.3
Do [G7.52,23.26,158Winterspring][QC951 Mathystra Relics]
Accept [G6.37,16.66Winterspring][QA2098 Gyromast's Retrieval]
[QC2098,3 -]Kill crabs along the coast [O]
[G61.4,9.4,150Darkshore]Kill [QC2098,1 Foreststriders][O]
[G55.59,12.9,20Darkshore]Kill [QC2098,2Murlocs][O]
[G61.4,9.4,100Darkshore][QC986-]Grind Moonstalker Sire/Matriarch for pelts
[G6.37,16.66Winterspring]Turn in [QT2098 Gyromast's Retrieval] \\Accept [QA2078 Gyromast's Revenge]
[G5.59,21.09Winterspring][QC2078-]Speak with *The Threshwackonator 4100*\\Escort it back to Gyromast and kill it
Turn in [G6.37,16.66Winterspring][QT2078 Gyromast's Revenge]
[O]Throw away *Gyromast's Key*-->>Destroy,7442
Accept [G3.1,20.9Winterspring][QA4727 Beached Sea Turtle]
Finish off [QC1138]

[A Dwarf,Hunter]Grind until your HS cooldown is <6 minutes then death warp to Auberdine[OC]
[A Dwarf,Hunter]Turn in [G19.98,14.4Felwood][QT4763 The Blackwood Corrupted]
[A Dwarf,Hunter]Turn in [G21.63,18.15Felwood][QT2139 Tharnariun's Hope]
[A Dwarf,Hunter]Take the boat to Darnassus\\[G58.40,94.02Teldrassil][P]Get the Teldrassil FP
[A Dwarf,Hunter][T]Train spells-->>Trainer
[A Dwarf,Hunter][T][O][G57.55,46.73Darnassus]Train bows/staves-->>Trainer,11866
[A Dwarf,Hunter][T][O][G63.3,66.3Darnassus]Buy a level 20 bow and a 10 slot quiver-->>Collect,3027,1,11362,1
[A Dwarf,Hunter][G23.7,64.51Teldrassil]Turn in [QT741 The Absent Minded Prospector] pt.3 \\Accept [QA942 The Absent Minded Prospector] pt.4

[H][OC]Hearth back to Auberdine

Turn in [G19.1,20.63Felwood][QT4727 Beached Sea Turtle]
Turn in [G18.5,19.87Felwood][QT1138 Fruit of the Sea]
Turn in [G19.98,14.4Felwood][QT4763 The Blackwood Corrupted] --\\Accept [QA10752 Onward to Ashenvale]
[A NightElf,Hunter][V]Buy extra arrows/supplies-->>Vendor
Turn in [G21.63,18.15Felwood][QT2139 Tharnariun's Hope]
[A Hunter]Turn in [QT986 A Lost Master] pt.1 \\Accept [QA993 A Lost Master] pt.2-->>LoadNextGuide,1
[A Druid,Mage,Paladin,Priest,Rogue,Warlock,Warrior]Turn in [QT986 A Lost Master] pt.1 \\Accept [QA993 A Lost Master] pt.2
[A Druid,Mage,Paladin,Priest,Rogue,Warlock,Warrior]Take the boat to Menethil, fly to IF and take the tram to Stormwind\\*OR*\\Use the website unstuck self service to teleport back to SW\\Head to Redridge Mountains-->>ZoneSkip,Stormwind City,2
]], "Zarant")

--

Guidelime.registerGuide([[
[N15-19Darkshore]
[NX19-20Redridge Mountains]
[NX14-15Westfall]-->>ZoneSkip,Westfall,2
[GA Alliance,Druid,Mage,Paladin,Priest,Rogue,Warlock,Warrior]
[D Gnome/Dwarf/Human Darkshore route]
[A Human]Fly to Ironforge[OC]
[A Human][G30.61,34.49Dun Morogh] Leave IF and start heading towards the mountain shortcut\\\\[G32.75,26.10Dun Morogh] Run up the hill and die by jumping down to your left\\Spirit rez at Menethil Harbor[OC]
[A Human][G9.6,59.6Wetlands][P Get the Menethil FP][OC]
[G56.25,92.44Teldrassil]Turn in [QT6344 Nessa Shadowsong] \\Accept [QA6341 The Bounty of Teldrassil][A NightElf]
[G58.39,94.01Teldrassil]Turn in [QT6341 The Bounty of Teldrassil] \\Accept [QA6342 Flight to Auberdine][A NightElf]
[F Fly to Darkshore][OC][A NightElf]
Head to Auberdine\\Accept [G19.1,20.63Felwood][QA3524 Washed Ashore]
[A Dwarf,Human,Gnome][G19.1,20.63Felwood][P Get the Auberdine flight path]
[G19.27,19.14Felwood]Turn in [QT6342 Flight to Auberdine][A NightElf] \\Accept [QA6343 Return to Nessa][A NightElf]
[S]SET HEARTHSTONE TO *AUBERDINE*
[G19.51,18.97Felwood]Accept [QA983 Buzzbox 827]
[G21.63,18.15Felwood]Accept [QA2118 Plagued Lands] \\Accept [QA984 How Big a Threat?]
[QC983 Kill crabs along the coast][O]
[G18.81,26.69Felwood][QC3524 Loot the sea creature remains]
[O]Save Strider Meat x5 for later-->>Collect,5469,5
[QC2118-]Capture a rabid thistle bear
[G22.39,29.45,96Felwood][QC984 Head towards the fulborg camp]

Turn in [G19.13,21.39Felwood][QT983 Buzzbox 827] \\Accept [QA1001 Buzzbox 411]
Turn in [G19.1,20.63Felwood][QT3524 Washed Ashore pt.1] \\Accept [QA4681 Washed Ashore pt.2]

Accept [G18.1,18.48Felwood][QA963 For Love Eternal]
[QC1001 -][O]Start working on darkshore threshers
[G33.70,42.45,20Darkshore]Run up to the docks then jump in the water at the intersection\\
[G13.63,21.44Felwood][QC4681 -]Click on the sea turtle remains
Turn in [G19.1,20.63Felwood][QT4681 Washed Ashore]

[G19.9,18.4Felwood]Accept [QA947 Cave Mushrooms]
[G20.34,18.12Felwood]Accept [QA4811 The Red Crystal]
Turn in [G21.63,18.15Felwood][QT2118 Plagued Lands] \\Accept [QA2138 Cleansing of the Infected]
Turn in [G22.24,18.22Felwood][QT984 How Big a Threat?] pt.1 \\Accept [QA985 How Big a Threat?] pt.2 \\Accept [QA4761 Thundris Windweaver]
[A Dwarf,Gnome,Human]Accept [G20.8,15.58Felwood][QA982 Deep Ocean, Vast Sea]
Turn in [G19.98,14.4Felwood][QT4761 Thundris Windweaver] \\Accept [QA4762 The Cliffspring River] \\Accept [QA958 Tools of the Highborne] \\Accept [QA954 Bashal'Aran]

Run north along the coast killing Threshers[OC]
Accept [G25.15,4.61Felwood][QA4723 Beached Sea Creature]
[G20.94,1.49Felwood][QC982,1-]Enter the 1st ship by the hole on the hull
[G39.63,27.45Darkshore][QC982,2-]Enter the 2nd ship by the hole on the hull
Turn in [G25.19,1.29Felwood][QT1001 Buzzbox 411] \\Accept [QA1002 Buzzbox 323]
[QC1002-][O]Kill any type of Moonstalker
[QC2138-][O]Kill Rabid thistle bears

[G50.81,25.50Darkshore]Use the [QC4762 Empty Sampling Tube] at the base of the waterfall
Turn in [G27.7,10.03Felwood][QT954 Bashal'Aran] pt.1 \\Accept [QA955 Bashal'Aran] pt.2
[G29.13,12.34,153Felwood][QC955 Kill Imps]
Turn in [G27.7,10.03Felwood][QT955 Bashal'Aran] pt.2 \\Accept [QA956 Bashal'Aran] pt.3
[G29.6,12.52,151Felwood][QC956 Kill satyrs]
Turn in [G27.7,10.03Felwood][QT956 Bashal'Aran] pt.3 \\Accept [QA957 Bashal'Aran] pt.4

[O]Start collecting small eggs for leveling cooking later\\You will need 10 points in cooking to accept a quest later
[G31.29,24.14Felwood]Run up to [QC4811 The Red Crystal] in the mountains

[G40.3,59.7Darkshore]Accept [QA953 The Fall of Ameth'Aran]
[QC963 -][O]Kill Anaya Dawnrunner-->>Unitscan,ANAYA DAWNRUNNER
[G25.98,40.62Felwood][QC953,2 The Fall of Ameth'Aran]
[G25.66,39.11Felwood][QC957 Bashal'Aran]
[G26.71,35.53Felwood][QC953,1 The Fall of Ameth'Aran]
Finish off [QC958 Tools of the Highborne]
Turn in [G23.29,36.73Felwood][QT953 The Fall of Ameth'Aran]
[G18.41,49.43Felwood][QA4728 Beached Sea Creature]
[G19.64,39.52Felwood][QA4722 Beached Sea Turtle]
Finish off [QC2138]
[G22.39,29.45Felwood][QC985-]Kill fulborgs

Accept [G18.5,19.87Felwood][QA1138 Fruit of the Sea]
[G19.1,20.63Felwood]Turn in [QT4723 Beached Sea Creature]\\Turn in [QT4728 Beached Sea Creature]\\Turn in [QT4722 Beached Sea Turtle]
Turn in [G18.1,18.48Felwood][QT963 For Love Eternal]

Accept [G20.04,16.35Felwood][QA729 The Absent Minded Prospector]
[G20.8,15.58Felwood]Buy *Mild Spice* and cook herb baked eggs if you don't have 10 points in cooking\\[G37.7,40.7Darkshore]Accept [QA2178][O]
Turn in [G20.8,15.58Felwood][QT982 Deep Ocean, Vast Sea]
Turn in [G19.98,14.4Felwood][QT958 Tools of the Highborne]\\Turn in [QT4762 The Cliffspring River] \\Accept [QA4763 The Blackwood Corrupted]

Turn in [G20.34,18.12Felwood][QT4811 The Red Crystal] \\Accept [QA4812 As Water Cascades]
[G37.78,44.06Darkshore][O]Fill the Empty Bowl at the moonwell-->>Collect,12347,1
[G37.78,44.06Darkshore][QC4812-] Fill the *Empty Water Tube* at the moonwell

Turn in [G21.63,18.15Felwood][QT2138 Cleansing of the Infected] \\Accept [QA2139 Tharnariun's Hope]
Turn in [G22.24,18.22Felwood][QT985 How Big a Threat?] \\Accept [QA986 A Lost Master]
[G21.86,18.3Felwood]Run upstairs \\Accept [QA965 The Tower of Althalaxx] pt.1

Click on the red crystal\\Turn in [G31.29,24.14Felwood][QT4812 As Water Cascades] \\Accept [QA4813 The Fragments Within]
Turn in [G27.7,10.03Felwood][QT957 Bashal'Aran]
[G50.74,34.68Darkshore]Head to the fulborg camp north, loot the Grain Stores[OC]-->>Collect,12342,1
[G52.46,36.90Darkshore]Cimb the ramp and kill the [QC2139 Den Mother]
Loot the Nut/Fruit Stores and use the bowl to summon [QC4763 Xabraxxis]

[G5.49,36.64,144Winterspring]Head to the cave above the waterfall
[QC947,1-]Loot the blue mushrooms on the ground[OC]
[QC947,2-]Once you enter the cave, turn right and look for a yellow mushroom on the ground
Finish off [QC947]
Turn in [G1.42,26.89Winterspring][QT1002 Buzzbox 323] \\Accept [QA1003 Buzzbox 525]

Turn in [G4.82,27.18Winterspring][QT965 The Tower of Althalaxx] pt.1 \\Accept [QA966 The Tower of Althalaxx] pt.2
[G6.06,28.81,154Winterspring][QC966 Kill cultists]
Turn in [G4.82,27.18Winterspring][QT966 The Tower of Althalaxx] pt.2 \\Accept [QA967 The Tower of Althalaxx] pt.3
Do [G7.52,23.26,158Winterspring][QC951 Mathystra Relics]
Accept [G6.37,16.66Winterspring][QA2098 Gyromast's Retrieval]
[QC2098,3 -]Kill crabs along the coast [O]
[G61.4,9.4,150Darkshore]Kill [QC2098,1 Foreststriders][O]
[G55.59,12.9,20Darkshore]Kill [QC2098,2Murlocs][O]
[G61.4,9.4,100Darkshore][QC986-]Grind Moonstalker Sire/Matriarch for pelts
[G6.37,16.66Winterspring]Turn in [QT2098 Gyromast's Retrieval] \\Accept [QA2078 Gyromast's Revenge]
[G5.59,21.09Winterspring][QC2078-]Speak with *The Threshwackonator 4100*\\Escort it back to Gyromast and kill it
Turn in [G6.37,16.66Winterspring][QT2078 Gyromast's Revenge]
[O]Throw away *Gyromast's Key*-->>Destroy,7442
Accept [G3.1,20.9Winterspring][QA4727 Beached Sea Turtle]

[G44.18,20.6Darkshore]Kill Reef Crawlers/Encrusted Tide Crawlers for [QC1138 Fine Crab Chunks][OC] 
Accept [G44.18,20.6Darkshore][QA4725 Beached Sea Turtle]
Finish off [QC1138]
[A NightElf]Grind until your HS cooldown is <6 minutes then death warp to Auberdine [OC]
[H][OC]Hearth back to Auberdine
[G19.1,20.63Felwood]Turn in [QT4725 Beached Sea Turtle]\\Turn in [QT4727 Beached Sea Turtle]
Turn in [G18.5,19.87Felwood][QT1138 Fruit of the Sea]
[G19.78,19.07Felwood]Click on the wanted poster outside the inn \\Accept [QA4740 WANTED: Murkdeep!]
Turn in [G20.34,18.12Felwood][QT4813 The Fragments Within]
Turn in [G19.9,18.4Felwood][QT947 Cave Mushrooms] \\Accept [QA948 Onu]
Turn in [G21.63,18.15Felwood][QT2139 Tharnariun's Hope]
Turn in [QT986 A Lost Master] pt.1 \\Accept [QA993 A Lost Master] pt.2
Turn in [G19.98,14.4Felwood][QT4763 The Blackwood Corrupted]

Take the boat to Menethil, fly to IF and take the tram to Stormwind\\*OR*\\Use the website unstuck self service to teleport back to SW-->>LoadNextGuide,1
]], "Zarant")







local z = Guidelime.Zarant

function z:Darkshore_vendor_1(args,event)

	local _, class = UnitClass("player");
	local bags = true
	for bag = BACKPACK_CONTAINER+1, NUM_BAG_FRAMES do
		local numSlots = GetContainerNumSlots(bag)
		if numSlots == 0 then
			bags = false
		end
	end
	if event == "MERCHANT_SHOW" then
		self.merchant = true
	end
	if bags and self.merchant and not(GetItemCount(2515)+GetItemCount(2512) < 1800 and class == "HUNTER") then
		self:SkipStep()
	end
	
end

function z:Darkshore_vendor_2(args,event)
	local id = 3027
	local heavyRecurve = (GetInventoryItemID("player",18) == id or GetItemCount(id) > 0)
	id = 3026
	local reinforced = (GetInventoryItemID("player",18) == id or GetItemCount(id) > 0)
	if reinforced and recurve then
		self:SkipStep()
		return
	end
	if event == "MERCHANT_SHOW" then
		self.merchant = true
	elseif	event == "MERCHANT_CLOSED" then
		self.merchant = false
		C_Timer.After(5,function()
			if not self.merchant and heavyRecurve then
				self:SkipStep()
			end
		end)
	end
end
