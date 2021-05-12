if Guidelime.Zarant.faction == "Alliance" then
	return
end

Guidelime.registerGuide([[
[DL1-60 https://github.com/Zarant/Guidelime_Zarant Guidelime_Zarant]
[GA Horde]
[N45-46Swamp of Sorrows]
[NX46-48Tanaris]
[D Horde Hunter Leveling Guide - WORK IN PROGRESS]
[G34.3,66.0Swamp of Sorrows]Accept [QA2784 Fall From Grace]
[QC2784-]Go through the whole dialogue-->>SkipGossip
Turn in [QT2784 Fall From Grace]\\
Accept [QA2621 The Disgraced One]
[G47.9,55.0Swamp of Sorrows]Accept [QA1429 The Atal'ai Exile]\\
Turn in [QT2621 The Disgraced One]\\
Accept [QA2622 The Missing Orders]
--[G44.7,57.1Swamp of Sorrows]Accept [QA1430 Fresh Meat]\\
[G44.7,57.1Swamp of Sorrows]Turn in [QT2622 The Missing Orders]\\
Accept [QA2623 The Swamp Talker]
Accept [QA699]
Collect [QC699,1-][O]Sawtooth Snapper Claw (x6)
Collect [QC1383,1-][O]Shadow Panther Heart (x5)
--[G77.0,4.0Swamp of Sorrows]Collect [QC1430,1-]Monstrous Crawler Leg (x10)
[G81.4,80.8Swamp of Sorrows]Turn in [QT699 Lack of Surplus]\\
Accept [QA1422 Threat From the Sea]
[G83.7,80.5Swamp of Sorrows]Turn in [QT1422 Threat From the Sea]\\
Accept [QA1426 Threat From the Sea]
Do [QC1426]
[G83.7,80.5Swamp of Sorrows]Turn in [QT1426 Threat From the Sea]\\
Accept [QA1427 Threat From the Sea]
[G81.4,80.8Swamp of Sorrows]Turn in [QT1427]
Accept [QA1428 Continued Threat]
[G62.9,87.4Swamp of Sorrows]Collect [QC2623,1-]Warchief's Orders-->>Unitscan,Swamp Talker
Finish off [QC1428]
[G83.7,80.4Swamp of Sorrows]Turn in [QT1428 Continued Threat]
Die on purpose and spirit rez[OC]
--[G44.7,57.1Swamp of Sorrows]Turn in [QT1430 Fresh Meat]
[G34.3,66.0Swamp of Sorrows]Turn in [QT2623 The Swamp Talker]\\
Accept [QA2801 A Tale of Sorrow]
[QC2801,1-]Go through the whole dialogue-->>SkipGossip
Turn in [QT2801 A Tale of Sorrow]
[G22.9,48.3Swamp of Sorrows]Turn in [QT624 Cortello's Riddle]\\
Accept [QA625 Cortello's Riddle]
[G27.8,29.1Deadwind Pass]Turn in [QT1383 Nothing But The Truth]\\
Accept [QA1388 Nothing But The Truth]\\
Turn in [QT1388 Nothing But The Truth]
[H]Hearth to Camp Mojache
[G74.5,43.4Feralas]Turn in [QT3122 Return to Witch Doctor Uzer'i]\\Accept [QA3123] \\Accept [QA3380]
Fly to [F Tanaris]-->>LoadNextGuide
]],"Zarant")

Guidelime.registerGuide([[
[DL1-60 https://github.com/Zarant/Guidelime_Zarant Guidelime_Zarant]
[GA Horde]
[N46-48Tanaris]
[NX48-49The Hinterlands]
[D Horde Hunter Leveling Guide - WORK IN PROGRESS]
[G52.7,7.8Tanaris]Turn in [QT1119 Zanzil's Mixture and a Fool's Stout]
[G54.3,7.1Tanaris]Turn in [QT1187 Razzeric's Tweaking]\\
Accept [QA1188 Safety First]
[G52.7,7.8Tanaris]Accept [QA1120 Get the Gnomes Drunk]
[G52.6,7.6Tanaris]Turn in [QT1120 Get the Gnomes Drunk]
[G52.7,7.8Tanaris]Accept [QA1122 Report Back to Fizzlebub]

[V][O]Withdraw the following items from your bank:\\  Hippogryph Egg\\  Yeh'kinya's Bramble-->>BankWithdraw,8564,10699
[V][O]Deposit the following items in your bank:\\  Fool's Stout Report\\  Bundle of Atal'ai Artifacts\\  Wildkin Muisek Vessel-->>BankDeposit,5807,6193,9618
[G51.9,27.0Tanaris]Accept [QA2875 WANTED: Andre Firebeard]
Accept [QA3362]
[G51.0,27.3Tanaris]Turn in [QT1188 Safety First]
[G50.2,27.5Tanaris]Accept [QA992 Gadgetzan Water Survey]

[G51.8,28.6Tanaris]Accept [QA2605 The Thirsty Goblin]
[S]Set your HS to Gadgetzan
[G52.8,27.4Tanaris]Accept [QA5863 The Dunemaul Compound]
[G52.3,27.0,1Tanaris]Click on the Egg-O-Matic and turn in your Hippogryph Egg \\([QA2741-][QT2741])\\It's a small metal console sitting next to the teleporter looking thing

[G66.6,22.3Tanaris]Accept [QA8365 Pirate Hats Ahoy!]
[G67.0,22.4Tanaris]Turn in [QT3520 Screecher Spirits]
[G67.1,23.9Tanaris]Accept [QA8366 Southsea Shakedown]
[G67.1,23.9Tanaris]Accept [QA2873 Stoley's Shipment]

[G68.85,41.55Tanaris][G73.2,47.1,140Tanaris]Head to Lost Rigger Cove
[QC2875-]Kill Andre Firebeard by the campfire[O]
[QC8365-][OC][QC8366-][OC]Kill pirates
Loot [QC2873] upstairs
[QC8365-][QC8366-]Kill more pirates
Grind pirates until you find a distress beacon\\Accept [QA351][O]\\Skip this step and grind an extra 5% xp if you don't find it
[XP47.5 Grind to level 47+50%]\\Make sure you have enough mageweave to do the Thunder Bluff+Orgrimmar+Darkspear cloth turn ins (9 stacks)
Grind until your HS is off cooldown\\[H]Hearth back to Gadgetzan
[G39.1,29.3Tanaris]Collect [QC992,1-]Tapped Dowsing Widget
Turn in [QT992 Gadgetzan Water Survey]\\
Accept [QA82 Noxious Lair Investigation]
Turn in [QT3380][OC]
[G52.7,45.9Tanaris]Accept [QA3161 Gahz'ridian]
[G34.8,44.3,120Tanaris]Collect [QC82,1-]Centipaar Insect Parts (x5)
[G41.5,57.8Tanaris]Kill [QC5863,3-]Gor'marok the Ravager
Finish off [QC5863]
--thistleshrub valley
[QC2605-][OC]Kill Dew Collectors 
Do [QC3362]
Finish off [QC2605]
Start the escort quest\\Accept [QA1560 Tooga's Quest]-->>Unitscan,Tooga
[G47.31,65.14,80Tanaris][L40.68,72.98]Do [QC3161]
[G60.2,64.7Tanaris]Turn in [QT351 Find OOX-17/TN!]
Start the escort quest\\Accept [QA648 Rescue OOX-17/TN!]
[QC648-][O]Escort the robot chicken
[G66.6,25.7Tanaris]Turn in [QT1560 Tooga's Quest]

[G67.0,23.9Tanaris]Turn in [QT2875 WANTED: Andre Firebeard]\\
Turn in [QT8366 Southsea Shakedown]
[G67.1,23.9Tanaris]Turn in [QT2873 Stoley's Shipment]\\
Accept [QA2874 Deliver to MacKinley]
[G66.6,22.3Tanaris]Turn in [QT8365 Pirate Hats Ahoy!]

[H][OC]Hearth back to Gadgetzan
[V][O]Deposit *Stoley's Bottle* in your bank-->>BankDeposit,9245
[G51.8,28.6Tanaris]Turn in [QT2605 The Thirsty Goblin]\\
Accept [QA2606 In Good Taste]
[G50.9,27.0Tanaris]Turn in [QT82 Noxious Lair Investigation]
[G51.1,26.9Tanaris]Turn in [QT2606 In Good Taste]\\
Accept [QA2641 Sprinkle's Secret Ingredient]
[G50.2,27.5Tanaris]Accept [QA10 The Scrimshank Redemption]
[G51.5,26.8Tanaris]Turn in [QT3362 Thistleshrub Valley]
[G52.8,27.4Tanaris]Turn in [QT5863 The Dunemaul Compound]
[G52.7,45.9Tanaris]Turn in [QT3380]
[G52.7,45.9Tanaris]Turn in [QT3161 Gahz'ridian]
[G54.63,70.75Tanaris]Enter the eastern bug hole \\[G55.97,71.18Tanaris][QC10-]Loot the machine console looking thing
[A Hunter]Die on purpose and spirit rez at Gadgetzan[OC]
Turn in [QT10 The Scrimshank Redemption]\\
Accept [QA110 Insect Part Analysis]
[G50.9,27.0Tanaris]Turn in [QT110 Insect Part Analysis]\\
Accept [QA113 Insect Part Analysis]
[G50.2,27.5Tanaris]Turn in [QT113 Insect Part Analysis]\\
Accept [QA32 Rise of the Silithid]
Fly to [F Dustwallow Marsh][OC]
[G31.1,66.1Dustwallow Marsh]Turn in [QT625 Cortello's Riddle]\\
[G31.1,66.1Dustwallow Marsh]Accept [QA626 Cortello's Riddle]
Die and spirit rez[OC]
Fly to [F Thunder Bluff]
[V][O]Withdraw the following items from your bank:\\  Deadmire's Tooth\\  Sealed Field Testing Kit\\  Bundle of Atal'ai Artifacts\\  Wildkin Muisek Vessel\\  Long Elegant Feather-->>BankWithdraw,5945,8527,6193,9618,4589
[L43.1,43.0Thunder Bluff]Do the Thunder Bluff cloth hand ins:\\
[QA7820-][O][QT7820-][O]Wool\\
[QA7821-][O][QT7821-][O]Silk\\
[QA7822-][O][QT7822-][O]Mageweave
[G61.5,80.9Thunder Bluff]Turn in [QT1205 Deadmire]
Fly to [F Orgrimmar][O]
[L37.8,87.8Orgrimmar]Do the Darkspear cloth turn ins:\\[QA7833-][O][QT7833-][O]Wool\\[QA7834-][O][QT7834-][O]Silk \\[QA7835-][O][QT7835-][O]Mageweave
[L63.4,51.0Orgrimmar]Do the Orgrimmar cloth turn-ins:\\[QA7826-][O][QT7826-][O]Wool\\[QA7827-][O][QT7827-][O]Silk\\[QA7831-][O][QT7831-][O]Mageweave
[G56.4,46.5Orgrimmar]Turn in [QT32 Rise of the Silithid]
[G59.4,36.7Orgrimmar]Accept [QA649 Ripple Recovery]
[G59.5,36.8Orgrimmar]Turn in [QT649 Ripple Recovery]\\
Accept [QA650 Ripple Recovery]
Accept [QA4300]
Take the Zeppelin to Undercity-->>ZoneSkip,Tirisfal Glades,1
]],"Zarant")

Guidelime.registerGuide([[
[DL1-60 https://github.com/Zarant/Guidelime_Zarant Guidelime_Zarant]
[GA Horde]
[N48-49The Hinterlands]
[NX49-50Feralas]
[D Horde Hunter Leveling Guide - WORK IN PROGRESS]
[G73.2,32.8Undercity]Accept [QA2995 Lines of Communication]
[G48.5,71.9Undercity]Accept [QA3568 Seeping Corruption]
[G50.0,68.2Undercity]Turn in [QT864 Return to Apothecary Zinge]
[V][O]Deposit *Box of Empty Vials* in your bank-->>BankDeposit,10695,10687,10688,10689,10690
Fly to [F Tarren Mill]
[OC]Kill birds in hinterlands-->>Unitscan,Razorbeak Skylord,Trained Razorbeak,Razorbeak Gryphon
[V][O]Collect Long Elegant Feather (x10)-->>Collect,4589,10
Collect [QC3123,1-][O]Wildkin Muisek (x10)

[G23.5,58.8The Hinterlands]Accept [QA2933 Venom Bottles]
[G26.7,48.6The Hinterlands]Turn in [QT650 Ripple Recovery]\\
Accept [QA77 A Sticky Situation]
[G72.5,66.2,50The Hinterlands]Head to Revantusk Village\\
[G77.1,80.0The Hinterlands]Accept [QA7839 Vilebranch Hooligans]
[G78.2,81.3The Hinterlands]Accept [QA7840 Lard Lost His Lunch]
[G80.4,81.5The Hinterlands]Accept [QA7815 Snapjaws, Mon!]\\
Accept [QA7816 Gammerita, Mon!]
--[G81.7,81.8The Hinterlands][P]Get The Hinterlands FP
Collect [QC580,1-][O]Pupellyverbos Port (x12)
Kill [QC7816,1-][O]Gammerita-->>Unitscan,Gammerita
Kill [QC7815,1-][O]Saltwater Snapjaw (x15)
[G80.8,46.8The Hinterlands]Turn in [QT626 Cortello's Riddle]
[G84.4,41.3The Hinterlands]Collect [QC7840,1-]Lard's Lunch


[G80.3,81.4The Hinterlands]Turn in [QT7815 Snapjaws, Mon!]
Turn in [QT7816 Gammerita, Mon!]
[G78.2,81.3The Hinterlands]Turn in [QT7840 Lard Lost His Lunch]
[G78.8,78.4The Hinterlands]Accept [QA7844 Cannibalistic Cousins]
[G79.4,79.1The Hinterlands]Accept [QA7841 Message to the Wildhammer]
[G79.1,79.5The Hinterlands]Accept [QA7828 Stalking the Stalkers]\\
Accept [QA7829 Hunt the Savages]\\
Accept [QA7830 Avenging the Fallen]
Collect [QC7839,1-][O]Slagtree's Lost Tools\\It has 5 different possible spawn locations
[G57.5,39.5The Hinterlands]Collect [QC77,1-]Hinterlands Honey Ripple (x10)
[G26.7,48.6The Hinterlands]Turn in [QT77 A Sticky Situation]\\
Accept [QA81 Ripple Delivery]
[G29.6,48.7The Hinterlands][QC2995,2-]Burn the Highvale Notes
[G28.6,46.1The Hinterlands][QC2995,3-]Burn the Highvale Report
[G32.0,46.9The Hinterlands][QC2995,1-]Burn the Highvale Records
Start the escort quest\\Accept [QA2742][O]\\ \\[QC2742-][O]Escort Rin'ji
Finish off [QC7841]
[G33.7,75.1The Hinterlands]Turn in [QT1429 The Atal'ai Exile] \\Accept [QA1444 Return to Fel'Zerul]
[G40.0,59.9The Hinterlands]Collect [QC2641,1-]Violet Tragan


[G79.3,79.1The Hinterlands]Turn in [QT7841 Message to the Wildhammer]\\
Accept [QA7842 Another Message to the Wildhammer]
Turn in [QT7842 Another Message to the Wildhammer]\\
Accept [QA7843 The Final Message to the Wildhammer]

[G14.4,48.1The Hinterlands][QC7843,1-]Message to the Wildhammer Delivered
Kill [QC7829,1-][O]Savage Owlbeast (x20)
Collect [QC7830,1-][O]Skylord Plume-->>Unitscan,Razorbeak Skylord
[L45.2,66.4The Hinterlands]Do [QC7844][O]
Kill [QC7828,2-]Silvermane Howler (x15)
[G70.9,62.4The Hinterlands]Kill [QC7828,1-][O]Silvermane Stalker (x15)

[G49.3,37.7The Hinterlands]Turn in [QA485-][QT485 Find OOX-09/HL!]\\Skip this step if you haven't found the Distress Beacon
Start the chicken escort\\Accept [QA836 Rescue OOX-09/HL!]
[QC836-]Escort the robot chicken

[G86.3,59.0The Hinterlands]Turn in [QT2742 Rin'ji is Trapped!]\\
Accept [QA2782 Rin'ji's Secret]

[G77.2,80.2The Hinterlands]Turn in [QT7839 Vilebranch Hooligans]
[G78.8,78.4The Hinterlands]Turn in [QT7844 Cannibalistic Cousins]
[G79.1,79.5The Hinterlands]Turn in [QT7828 Stalking the Stalkers]\\
Turn in [QT7829 Hunt the Savages]\\
Turn in [QT7830 Avenging the Fallen]


[G79.4,79.1The Hinterlands]Turn in [QT7843 The Final Message to the Wildhammer]
Fly to [F Tarren Mill][OC]
[G61.5,19.2Hillsbrad Foothills]Turn in [QT2933 Venom Bottles]
Fly to [F Undercity]
[L71.7,29.2Undercity]Do the Undercity cloth turn ins:\\[QA7813-][O][QT7813-][O]Wool \\[QA7814-][O][QT7814-][O]Silk \\[QA7817-][O][QT7817-][O]Mageweave
[G73.5,32.7Undercity]Turn in [QT2995 Lines of Communication]\\
Turn in [QT2782 Rin'ji's Secret]\\Turn in [QA8273-][QT8273]
[G47.4,73.1Undercity]Accept [QA4293 A Sample of Slime...]


[H]Hearth to Tanaris
[V][O]Deposit the following items:\\Pupellyverbos Port\\Dran's Ripple Delivery-->>BankDeposit,3900,8685
[G51.1,26.9Tanaris]Turn in [QT2641 Sprinkle's Secret Ingredient]\\
Accept [QA2661 Delivery for Marin]
[G51.8,28.6Tanaris]Turn in [QT2661 Delivery for Marin]\\
Accept [QA2662 Noggenfogger Elixir]\\
Turn in [QT2662 Noggenfogger Elixir]
[O]Make sure you have 3 stacks of Noggenfogger and then deposit it in your bank, you will need it for later-->>Collect,8529,60
Fly to [F Feralas]-->>LoadNextGuide
]],"Zarant")


Guidelime.registerGuide([[
[DL1-60 https://github.com/Zarant/Guidelime_Zarant Guidelime_Zarant]
[GA Horde]
[N49-50Feralas]
[NX49-50Un'Goro]
[D Horde Hunter Leveling Guide - WORK IN PROGRESS]
[G76.2,43.8Feralas]Accept [QA3062 Dark Heart]\\
Accept [QA3063 Vengeance on the Northspring]\\
Accept [QA4120 The Strength of Corruption]
[G74.5,42.9Feralas]Accept [QA7734 Improved Quality]
[G74.5,43.4Feralas]Turn in [QT3123 Testing the Vessel]\\
Accept [QA3124 Hippogryph Muisek]\\
[G74.5,43.4Feralas]Accept [QA3128 Natural Materials]
[G74.8,45.1Feralas][S]Set your HS to Camp Mojache
[G55.9,63.8Feralas]Collect [QC3124,1-]Hippogryph Muisek (x10)
Collect [QC3128,3-]Resilient Sinew (x20)
[G74.5,43.4Feralas]Turn in [QT3124 Hippogryph Muisek]\\
Accept [QA3125 Faerie Dragon Muisek]

Collect [QC3128,2-][O]Encrusted Minerals (x6)
[G68.8,48.1Feralas]Collect [QC3125,1-]Faerie Dragon Muisek (x8)
Turn in [QT3125 Faerie Dragon Muisek]\\
Accept [QA3126 Treant Muisek]
Collect [QC3128,1-][O]Splintered Log (x2)-->>Unitscan,Wandering Forest Walker
Collect [QC3126,1-]Treant Muisek (x3)-->>Unitscan,Wandering Forest Walker
Turn in [QT3126 Treant Muisek]
[G55.9,63.8Feralas]Finish off [QC3128]
[G53.4,55.7Feralas]Turn in [QA2766-][QT2766]\\Skip this step if you haven't found the distress beacon
Accept the chicken escort\\Accept [QA2767 Rescue OOX-22/FE!]
[QC2767-]Escort the chicken to the shore
[G44.8,43.4Feralas]Accept [QA7003 Zapped Giants]\\
Accept [QA7721 Fuel for the Zapping]
Do [QC7003] \\Do [QC7721]
[G44.8,43.4Feralas]Turn in [QT7003 Zapped Giants]\\
Turn in [QT7721 Fuel for the Zapping]
[G52.6,31.8Feralas]Collect [QC7734,1-]Rage Scar Yeti Hide (x10)
[G40.3,23.4Feralas]Collect [QC3127,1-]Mountain Giant Muisek (x7)\\Remember to use the Ultra-Shrinker on them
Kill Harpies until you get the Horn of Hatetalon[OC]-->>Collect,9530,1
[G40.5,8.6Feralas]Collect [QC3062,1-]Edana's Dark Heart
Finish off [QC3063]

[H][OC]Hearth back to Camp Mojache
[G74.4,43.4Feralas]Turn in [QT3127 Mountain Giant Muisek]\\
Turn in [QT3128 Natural Materials]\\
Accept [QA3129 Weapons of Spirit]
[G74.5,42.9Feralas]Turn in [QA7738-][OC][QT7738 Perfect Yeti Hide][OC]
[G74.5,42.9Feralas]Turn in [QT7734 Improved Quality]
[G74.4,43.4Feralas]Turn in [QT3129 Weapons of Spirit]
[G74.4,43.4Feralas]Accept [QA3380 The Sunken Temple]
[G76.2,43.8Feralas]Turn in [QT3063 Vengeance on the Northspring]
Turn in [QT3062 Dark Heart]
Fly to [F Tanaris]-->>LoadNextGuide


]],"Zarant")

Guidelime.registerGuide([[
[DL1-60 https://github.com/Zarant/Guidelime_Zarant Guidelime_Zarant]
[GA Horde]
[N49-50Un'Goro]
[NX50-51STV/Blasted Lands]
[D Horde Hunter Leveling Guide - WORK IN PROGRESS]
--[S]Set your HS to Tanaris
[G52.7,45.9Tanaris]Turn in [QT3380 The Sunken Temple]\\
Accept [QA3444 The Stone Circle]
Run to Un'goro Crater\\Accept [QA4289] \\Accept [QA4290]
Save Un'Goro Soil, you will need 25 later[OC]
[O]As you quest through Un'Goro, loot 7 crystals of each color-->>Collect,11186,7,11185,7,11184,7,11188,7
[G27.5,42.8Tanaris]Accept [QA4289 The Apes of Un'Goro]\\
Accept [QA4290 The Fare of Lar'korwi]
[G63.1,68.6Un'Goro Crater]Accept [QA3844 It's a Secret to Everybody]
[G63.1,69.0Un'Goro Crater]Turn in [QT3844 It's a Secret to Everybody]\\
Accept [QA3845 It's a Secret to Everybody]
[G68.8,56.8Un'Goro Crater]Collect [QC4290,1-]Piece of Threshadon Carcass
[G71.6,76.0Un'Goro Crater]Turn in [QT4290 The Fare of Lar'korwi]\\
Accept [QA4291 The Scent of Lar'korwi]
Do [G67.3,73.1Un'Goro Crater][G66.6,66.7Un'Goro Crater][QC4291] by stepping on a raptor nest
Turn in [QT4291 The Scent of Lar'korwi]\\
Accept [QA4292 The Bait for Lar'korwi]
Finish off [QC4300]
[QC3845-]Open the small pack in your inventory [OC]
[G44.7,8.1Un'Goro Crater]Turn in [QT3845 It's a Secret to Everybody]\\
Accept [QA3908 It's a Secret to Everybody]
[G45.5,8.7Un'Goro Crater]Accept [QA4145 Larion and Muigin]
[G39.8,24.0Un'Goro Crater]Kill [QC4145,2-]Bloodpetal Trapper (x5)
Finish off [QC4145] in northeastern Un'Goro
Turn in [QT4145 Larion and Muigin]\\
Accept [QA4147 Marvon's Workshop]
[G41.9,2.7Un'Goro Crater]Turn in [QA4284-][QT4284 Crystals of Power]
[S]Fly to Crossroads and set your HS to crossroads\\OR\\Use the website unstuck request and set your HS to Orgrimmar
Turn in [QT4300]-->>ZoneSkip,The Barrens
Fly to [F Ratchet]-->>LoadNextGuide
]],"Zarant")