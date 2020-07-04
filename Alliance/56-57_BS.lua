
Guidelime.registerGuide([[
[N56-57Burning Steppes]
[NX57-58Western/Eastern Plaguelands part 1]
[GA Alliance]
[D Alliance Leveling Guide]
Take the boat to Wetlands-->>ZoneSkip,Wetlands
Fly to [F Ironforge]
[A Druid,Mage,Paladin,Priest,Rogue,Warlock,Warrior][V][O]Withdraw the following: Drawing Kit\\Filled Cursed Ooze Jar\\Filled Tainted Ooze Jar\\Janice's Parcel\\Black Dragonflight Molt --BANKFRAME_OPENED,BAG_UPDATE>>BankW_Winterspring54

Turn in [QT4512]
--Accept [QA4513]--slime pt.2, unused
Turn in [QT3461]
[G18.54,51.66Ironforge][S]Set your HS to Ironforge
Accept [QA3702] pt.1
[QC3702-]Listen to her story-->>SkipGossip
Turn in [QT3702] pt.1\\Accept [QA3701] pt.2
Fly to [F Bunring Steppes]
Accept [QA3823] \\Accept [QA4283]
Accept [QA4182]
[G77.54,46.79,20Burning Steppes][QC3823,2-]Start by killing Firegut Ogres
Accept [QA4726] \\Accept [QA4296]
[QC4726-][O]Kill broodlings as you go along, use the quest item when they get low
[QC4182,1-][O]Prioritize killing broodlings over anything else
Finish off [G82.80,37.40,60][QC3823]
[G95.09,31.56Burning Steppes]Turn in [QA4022-][O][QT4022][O] \\Skip this step if you don't have the Black Dragonflight Molt
Finish off [QC4182]
Turn in [QT3823] \\Accept [QA3824]
Turn in [QT4182] \\Accept [QA4183]
[QC3701-][O]Right click on the small stone obelisks on the ground
[G54.06,40.71Burning Steppes][QC4296-]Transcribe the tablet-->>SkipGossip
[QC4283-][OC]Kill orcs
Do [G38.89,54.73 Burning Steppes][QC3824]
Finish off [QC4283]
Turn in [QT4283] \\Turn in [QT3824] \\Accept [QA3825]
Fly to [F Redridge Mountains]
Turn in [QT4183] \\Accept [QA4184]
Fly to [F Stormwind]
--[V][O]Withdraw Janice's Parcel/Drawing Kit from your bank --BANKFRAME_OPENED,BAG_UPDATE BankW_Winterspring54
Turn in [QT5022] \\Accept [QA5048]
[G52.48,41.95Stormwind City]Find Ol'Emma, she can roam around SW from time to time\\Turn in [QT5048] \\Accept [QA5050]
Accept [QA6182] \\Turn in [QT4184] \\Accept [QA4185]
[QC4185-]Speak with Lady Katrana Prestor and go through her whole dialogue-->>SkipGossip
Turn in [QT4185]
Accept [QA4186]
Turn in [QT6182] \\Accept [QA6183] \\Turn in [QT6183] \\Accept [QA6184]
Fly to [F Redridge Mountains]
Turn in [QT4186] \\Accept [QA4223]
Fly to [F Burning Steppes]
Turn in [QT4223] \\Accept [QA4224]
Turn in [QT4726] \\Accept [QA4808] \\Turn in [QT4296]
[QC4224-]Talk to Ragged John-->>SkipGossip
[G81.04,46.71 Burning Steppes][QC3825-]Click on the dirt mound on top of the mountain
Turn in [QT3825]
Turn in [QT4224]
[H]Hearth to Ironforge
[V][O]Withdraw the follwing items:\\Everlook report\\Studies in spirit speaking\\4 relic fragments and Jaron's pick --BANKFRAME_OPENED,BAG_UPDATE>>BankW_BS56
[V][O]Make sure you have 2 stacks of noggenfogger with you-->>Collect,8529,40
[V][O]Deposit *Tinkee's Letter* in your bank --BANKFRAME_OPENED,BAG_UPDATE>>BankD_BS56
[G43.22,31.57Ironforge]Do the Ironforge cloth turn ins:\\[QA7807-][O][QT7807-][O]Wool \\[QA7808-][O][QT7808-][O]Silk \\[QA7804-][O][QT7804-][O]Mageweave \\[QA7805-][O][QT7805-][O]Runecloth
--Accept [QA4513]
[G43.22,31.57Ironforge]Do the Gnomeregan Exiles cloth turn ins:\\[QA7802-][O][QT7802-][O]Wool \\[QA7803-][O][QT7803-][O]Silk \\[QA7809-][O][QT7809-][O]Mageweave \\[QA7811-][O][QT7811-][O]Runecloth
Turn in [QT3701]
Fly to [F Southshore]--OnStepCompletion>>LoadNextGuide
]], "Zarant")


if not Guidelime.Zarant then return end

local z = Guidelime.Zarant



function z:BankD_BS56() --BANKFRAME_OPENED,BAG_UPDATE>>BankD_BS56
	--local items = {"Tinkee's Letter"}
	local items = {12899}
	
	if z.IsItemNotInBags(items) then
		z.SkipStep(self)
		return
	end

	z.DepositItems(items)

end

function z:BankW_BS56()  --BANKFRAME_OPENED,BAG_UPDATE>>BankW_BS56

	--local items = {"Everlook Report","Studies in Spirit Speaking","Jaron's Pick","First Relic Fragment","Second Relic Fragment","Third Relic Fragment","Fourth Relic Fragment"}
	local items = {15788,15790,12891,12896,12897,12898,12899}
	
	if z.IsItemNotInBank(items) then
		z.SkipStep(self)
		return
	end
	
	z.WithdrawItems(items)
end
