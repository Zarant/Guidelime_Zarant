
Guidelime.registerGuide([[
[N32-33Hillsbrad/Arathi]
[NX33-34Thousand Needles]
[GA Alliance]
[D Alliance Leveling Guide]
Head to Menethil Harbor[OC]
[G10.8,60.4Wetlands]Turn in [QT1301 James Hyal][O] pt.1 \\Accept [QA1302 James Hyal][O] pt.2
[G10.6,60.4Wetlands]Turn in [QT270][O] \\Accept [QA321][O]--Doomed fleet/lightforge iron
Turn in [QT1248 The Missing Diplomat] pt.10\\Accept [QA1249 The Missing Diplomat] pt.11
[QC1249 -] Go outside and defeat Tapoke Jahn
Turn in [QT1249 The Missing Diplomat] pt.11
Accept [QA1250 The Missing Diplomat] pt.12
Turn in [QT1250 The Missing Diplomat] pt.12\\Accept [QA1264 The Missing Diplomat] pt.13
Turn in [G12.1,64.19,20Wetlands][QT321 Lightforge Iron] \\Accept [QA324 The Lost Ingots]
[G9.54,69.7,180Wetlands][QC324 -] Kill murlocs
Turn in [G10.58,60.59,20Wetlands][QT324 The Lost Ingots] \\Accept [QA322 Blessed Arm]
Fly to [F Southshore]

As you quest through Hillsbrad pay attention to the syndicate assassin event in southshore \\If you manage to kill an assassin, turn in the [QA522-][O][QT522 Assassin's Contract][O] and skip the follow up
Fly to Southshore[OC]
Accept [G52.41,55.96,20Hillsbrad Foothills][QA564 Costly Menace]
Turn in [QT538]
Accept [G50.34,59.04,20Hillsbrad Foothills][QA659 Hints of a New Plague?]
--Accept [QA9435]
Accept [G51.46,58.38,20Hillsbrad Foothills][QA536 Down the Coast]
Accept [G51.88,58.67,20Hillsbrad Foothills][QA555 Soothing Turtle Bisque]
Set your HS to [S Southshore]
Do [G46.18,66.57,165Hillsbrad Foothills][QC536 Down the Coast]
Turn in [G51.46,58.38,20Hillsbrad Foothills][QT536 Down the Coast] \\Accept [QA559 Farren's Proof]
Do [G32.04,72.81,166Hillsbrad Foothills][QC559 Farren's Proof]
Turn in [G51.46,58.38,20Hillsbrad Foothills][QT559 Farren's Proof] \\Accept [QA560 Farren's Proof]
Turn in [G49.47,58.73,20Hillsbrad Foothills][QT560 Farren's Proof] \\Accept [QA561 Farren's Proof]
Accept [G48.13,59.1,20Hillsbrad Foothills][QA505 Syndicate Assassins]
Turn in [G51.46,58.38,20Hillsbrad Foothills][QT561 Farren's Proof] \\Accept [QA562 Stormwind Ho!]
[G57.31,67.82,139Hillsbrad Foothills][QC562 -] Kill Nagas
Turn in [G51.46,58.38,20Hillsbrad Foothills][QT562 Stormwind Ho!] \\Accept [QA563 Reassignment]
[G48.96,55.06Hillsbrad Foothills]Buy 4x[V]*Soothing Spices*--OnStepActivation,BAG_UPDATE,MERCHANT_SHOW>>SoothingSpices
[G40.15,92.44,140Alterac Mountains][QC689 -] Loot granite chunks inside the Yeti cave
[G30.92,84.58,100Alterac Mountains]Do [QC564 Costly Menace]
Click on the scroll on top of the table \\Accept [G58.31,67.92,20Alterac Mountains][QA510 Foreboding Plans] \\Accept [QA511 Encrypted Letter]
Do [G58.3,67.97,88Alterac Mountains][QC505 Syndicate Assassins]
[G69.3,12.4,60Hillsbrad Foothills][QC555,1 -] Kill turtles along the river
[G42.93,85.06Western Plaguelands]Get the [P Western Plaguelands] FP
Fly to [F Southshore]

Turn in [G50.57,57.09,20Hillsbrad Foothills][QT511 Encrypted Letter] \\Accept [QA514 Letter to Stormpike]
Turn in [G51.88,58.67,20Hillsbrad Foothills][QT555 Soothing Turtle Bisque]
Turn in [G48.13,59.1,20Hillsbrad Foothills][QT505 Syndicate Assassins] \\Turn in [QT510 Foreboding Plans]
Turn in [G52.41,55.96,20Hillsbrad Foothills][QT564 Costly Menace]

Fly to [F Arathi Highlands]
Accept [G45.83,47.55,20Arathi Highlands][QA681 Northfold Manor]
Turn in [G46.65,47.01,20Arathi Highlands][QT690 Malin's Request]
Turn in [G60.18,53.84,20Arathi Highlands][QT659 Hints of a New Plague?] \\Accept [QA658 Hints of a New Plague?]
[A Hunter][QC658 -][O] Use eagle eye to find the Forsaken Courier\\If the courier is not in Arathi, look for it in Hillsbrad after finishing Northfold Manor
[A Druid,Mage,Paladin,Priest,Rogue,Warlock,Warrior][QC658-][O]Kill the Forsaken courier if you happen to bump into it. She patrols the road between Tarren Mill and Go'Shek Farm
Do [QC681 Northfold Manor]
[A Hunter]Hearth back to [H Southshore][OC]
*Stable your pet* [A Hunter]
[A Hunter]Fly to [F Arathi Highlands][OC]
Turn in [G45.83,47.55,20Arathi Highlands][QT681 Northfold Manor]
Use eagle eye to find a level 32/33 spider \\Tame it and learn Bite rank 5 [O][A Hunter]
Turn in [QT658] \\Don't go out of your way to find the courier, you can skip this step and finish it later
[A Druid,Mage,Paladin,Priest,Rogue,Warlock,Warrior][H]Hearth to Southshore if you are far away from the Flight Path[OC]
Fly to [F Wetlands]--OnStepCompletion>>LoadNextGuide
]], "Zarant")

if not Guidelime.Zarant then return end
local z = Guidelime.Zarant

function z:SoothingSpices(args,event)
	local total = 4
	local id = 3713
	if IsQuestFlaggedCompleted(555) then
		total = total - 1
	end
	if IsQuestFlaggedCompleted(1218) then
		total = total - 3
	end
	
	local step = self.guide.steps[self.stepLine]
	if not self.element then
		table.insert(step.elements,{})
		self.element = #step.elements
	end

	local element = step.elements[self.element]
	local itemCount = GetItemCount(id)
	element.textInactive = ""
	
	if itemCount < total then
		element.text = string.format("\n\nSoothing Spices: %d/%d",itemCount,total)
	else
		return self:SkipStep()
	end
	if event == "MERCHANT_SHOW" and GuidelimeData.Merchant and total > 0 then
		z.BuyItem(id,total)
	end
	self:UpdateStep()

end