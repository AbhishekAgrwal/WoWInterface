--[[
-------------------------------------------
-- Addon: LoseControl Classic
-- Version: 1.00
-- Authors: millanzarreta, Kouri
-------------------------------------------

]]

local addonName, L = ...
local UIParent = UIParent -- it's faster to keep local references to frequently used global vars
local UnitAura = UnitAura
local GetTime = GetTime
local SetPortraitToTexture = SetPortraitToTexture
local pairs = pairs
local SetScript = SetScript
local OnEvent = OnEvent
local CreateFrame = CreateFrame
local SetTexture = SetTexture
local SetCooldown = SetCooldown
local SetAlpha, SetPoint = SetAlpha, SetPoint
local playerGUID, playerClass
local print = print
local debug = false -- type "/lc debug on" if you want to see UnitAura info logged to the console
local LCframes = {}
local InterruptAuras = { }
local LibClassicDurations = LibStub("LibClassicDurations")
LibClassicDurations:Register(addonName)

-------------------------------------------------------------------------------
-- Thanks to all the people on the Curse.com and WoWInterface forums who help keep this list up to date :)

local interruptsIds = {
	[72]     = {6, 1},		-- Shield Bash (rank 1) (Warrior)
	[1671]   = {6, 2},		-- Shield Bash (rank 2) (Warrior)
	[1672]   = {6, 3},		-- Shield Bash (rank 3) (Warrior)
	[1766]   = {5, 1},		-- Kick (rank 1) (Rogue)
	[1767]   = {5, 2},		-- Kick (rank 2) (Rogue)
	[1768]   = {5, 3},		-- Kick (rank 3) (Rogue)
	[1769]   = {5, 4},		-- Kick (rank 4) (Rogue)
	[2139]   = {10, 0},		-- Counterspell (Mage)
	[6552]   = {4, 1},		-- Pummel (rank 1) (Warrior)
	[6554]   = {4, 2},		-- Pummel (rank 2) (Warrior)
	[8042]   = {2, 1},		-- Earth Shock (rank 1) (Shaman)
	[8044]   = {2, 2},		-- Earth Shock (rank 2) (Shaman)
	[8045]   = {2, 3},		-- Earth Shock (rank 3) (Shaman)
	[8046]   = {2, 4},		-- Earth Shock (rank 4) (Shaman)
	[10412]  = {2, 5},		-- Earth Shock (rank 5) (Shaman)
	[10413]  = {2, 6},		-- Earth Shock (rank 6) (Shaman)
	[10414]  = {2, 7},		-- Earth Shock (rank 7) (Shaman)
	[13491]  = {5, -1},		-- Pummel (Iron Knuckles Item)
	[19244]  = {6, 1},		-- Spell Lock (felhunter) (rank 1) (Warlock)
	[19647]  = {8, 2},		-- Spell Lock (felhunter) (rank 2) (Warlock)
	[19675]  = {4, 1},		-- Feral Charge (Druid)
}

local interruptsSpellIdByName = { }

local spellIds = {
	----------------
	-- Druid
	----------------
	[339]    = "Root",				-- Entangling Roots (rank 1)
	[1062]   = "Root",				-- Entangling Roots (rank 2)
	[5195]   = "Root",				-- Entangling Roots (rank 3)
	[5196]   = "Root",				-- Entangling Roots (rank 4)
	[9852]   = "Root",				-- Entangling Roots (rank 5)
	[9853]   = "Root",				-- Entangling Roots (rank 6)
	[9005]   = "CC",				-- Pounce (rank 1)
	[9823]   = "CC",				-- Pounce (rank 2)
	[9827]   = "CC",				-- Pounce (rank 3)
	[5211]   = "CC",				-- Bash (rank 1)
	[8983]   = "CC",				-- Bash (rank 2)
	[6798]   = "CC",				-- Bash (rank 3)
	[2637]   = "CC",				-- Hibernate (rank 1)
	[18657]  = "CC",				-- Hibernate (rank 2)
	[18658]  = "CC",				-- Hibernate (rank 3)
	[19975]  = "CC",				-- Entangling Roots (rank 1) (Nature's Grasp talent)
	[19974]  = "CC",				-- Entangling Roots (rank 2) (Nature's Grasp talent)
	[19973]  = "CC",				-- Entangling Roots (rank 3) (Nature's Grasp talent)
	[19972]  = "CC",				-- Entangling Roots (rank 4) (Nature's Grasp talent)
	[19971]  = "CC",				-- Entangling Roots (rank 5) (Nature's Grasp talent)
	[19970]  = "CC",				-- Entangling Roots (rank 6) (Nature's Grasp talent)
	[22570]  = "CC",				-- Mangle (rank 1)
	[16922]  = "CC",				-- Starfire Stun (Improved Starfire talent)
	[19675]  = "Root",				-- Feral Charge Effect (Feral Charge talent)
	[17116]  = "Other",				-- Nature's Swiftness (talent) (!)
	[16689]  = "Other",				-- Nature's Grasp (rank 1) (!)
	[16810]  = "Other",				-- Nature's Grasp (rank 2) (!)
	[16811]  = "Other",				-- Nature's Grasp (rank 3) (!)
	[16812]  = "Other",				-- Nature's Grasp (rank 4) (!)
	[16813]  = "Other",				-- Nature's Grasp (rank 5) (!)
	[17329]  = "Other",				-- Nature's Grasp (rank 6) (!)
	[22812]  = "Other",				-- Barkskin
	[29166]  = "Other",				-- Innervate

	----------------
	-- Hunter
	----------------
	[1513]   = "CC",				-- Scare Beast (rank 1)
	[14326]  = "CC",				-- Scare Beast (rank 2)
	[14327]  = "CC",				-- Scare Beast (rank 3)
	[3355]   = "CC",				-- Freezing Trap (rank 1)
	[14308]  = "CC",				-- Freezing Trap (rank 2)
	[14309]  = "CC",				-- Freezing Trap (rank 3)
	[19386]  = "CC",				-- Wyvern Sting (talent) (rank 1)
	[24132]  = "CC",				-- Wyvern Sting (talent) (rank 2)
	[24133]  = "CC",				-- Wyvern Sting (talent) (rank 3)
	[19410]  = "CC",				-- Improved Concussive Shot (talent)
	[28445]  = "CC",				-- Improved Concussive Shot (talent)
	[19503]  = "CC",				-- Scatter Shot (talent)
	[19229]  = "Root",				-- Improved Wing Clip (talent)
	[19185]  = "Root",				-- Entrapment (talent)
	[2974]   = "Snare",				-- Wing Clip (rank 1)
	[14267]  = "Snare",				-- Wing Clip (rank 2)
	[14268]  = "Snare",				-- Wing Clip (rank 3)
	[5116]   = "Snare",				-- Concussive Shot
	[15571]  = "Snare",				-- Dazed (Aspect of the Cheetah and Aspect of the Pack)
	[13809]  = "Snare",				-- Frost Trap
	[13810]  = "Snare",				-- Frost Trap Aura
	[19263]  = "Other",				-- Deterrence
	[19574]  = "Other",				-- Bestial Wrath (talent)
	[5384]   = "Other",				-- Feign Death (!)
	
		----------------
		-- Hunter Pets
		----------------
		[24394]  = "CC",				-- Intimidation (talent)
		[25999]  = "Root",				-- Boar Charge (Boar)
		[26064]  = "Other",				-- Shell Shield (Turtle)

	----------------
	-- Mage
	----------------
	[118]    = "CC",				-- Polymorph (rank 1)
	[12824]  = "CC",				-- Polymorph (rank 2)
	[12825]  = "CC",				-- Polymorph (rank 3)
	[12826]  = "CC",				-- Polymorph (rank 4)
	[28270]  = "CC",				-- Polymorph: Cow
	[28271]  = "CC",				-- Polymorph: Turtle
	[28272]  = "CC",				-- Polymorph: Pig
	[12355]  = "CC",				-- Impact (talent)
	[18469]  = "Silence",			-- Counterspell - Silenced (Improved Counterspell talent)
	[11958]  = "Immune",			-- Ice Block (talent)
	[122]    = "Root",				-- Frost Nova (rank 1)
	[865]    = "Root",				-- Frost Nova (rank 2)
	[6131]   = "Root",				-- Frost Nova (rank 3)
	[10230]  = "Root",				-- Frost Nova (rank 4)
	[12494]  = "Root",				-- Frostbite (talent)
	[10]     = "Snare",				-- Blizzard (rank 1) (Improved Blizzard talent)
	[6141]   = "Snare",				-- Blizzard (rank 2) (Improved Blizzard talent)
	[8427]   = "Snare",				-- Blizzard (rank 3) (Improved Blizzard talent)
	[10185]  = "Snare",				-- Blizzard (rank 4) (Improved Blizzard talent)
	[10186]  = "Snare",				-- Blizzard (rank 5) (Improved Blizzard talent)
	[10187]  = "Snare",				-- Blizzard (rank 6) (Improved Blizzard talent)
	[120]    = "Snare",				-- Cone of Cold (rank 1)
	[8492]   = "Snare",				-- Cone of Cold (rank 2)
	[10159]  = "Snare",				-- Cone of Cold (rank 3)
	[10160]  = "Snare",				-- Cone of Cold (rank 4)
	[10161]  = "Snare",				-- Cone of Cold (rank 5)
	[116]    = "Snare",				-- Frostbolt (rank 1)
	[205]    = "Snare",				-- Frostbolt (rank 2)
	[837]    = "Snare",				-- Frostbolt (rank 3)
	[7322]   = "Snare",				-- Frostbolt (rank 4)
	[8406]   = "Snare",				-- Frostbolt (rank 5)
	[8407]   = "Snare",				-- Frostbolt (rank 6)
	[8408]   = "Snare",				-- Frostbolt (rank 7)
	[10179]  = "Snare",				-- Frostbolt (rank 8)
	[10180]  = "Snare",				-- Frostbolt (rank 9)
	[10181]  = "Snare",				-- Frostbolt (rank 10)
	[25304]  = "Snare",				-- Frostbolt (rank 11)
	--[6136]   = "Snare",				-- Chilled (Frost Armor)
	--[7321]   = "Snare",				-- Chilled (Ice Armor)
	[11113]  = "Snare",				-- Blast Wave (talent) (rank 1)
	[13018]  = "Snare",				-- Blast Wave (talent) (rank 2)
	[13019]  = "Snare",				-- Blast Wave (talent) (rank 3)
	[13020]  = "Snare",				-- Blast Wave (talent) (rank 4)
	[13021]  = "Snare",				-- Blast Wave (talent) (rank 5)
	[12043]  = "Other",				-- Presence of Mind (talent) (!)
	[12042]  = "Other",				-- Arcane Power (talent)

	----------------
	-- Paladin
	----------------
	[642]    = "Immune",			-- Divine Shield (rank 1)
	[1020]   = "Immune",			-- Divine Shield (rank 2)
	[498]    = "Immune",			-- Divine Protection (rank 1)
	[5573]   = "Immune",			-- Divine Protection (rank 2)
	[19753]  = "Immune",			-- Divine Intervention
	[1022]   = "ImmunePhysical",	-- Blessing of Protection (rank 1)
	[5599]   = "ImmunePhysical",	-- Blessing of Protection (rank 2)
	[10278]  = "ImmunePhysical",	-- Blessing of Protection (rank 3)
	[853]    = "CC",				-- Hammer of Justice (rank 1)
	[5588]   = "CC",				-- Hammer of Justice (rank 2)
	[5589]   = "CC",				-- Hammer of Justice (rank 3)
	[10308]  = "CC",				-- Hammer of Justice (rank 4)
	[20170]  = "CC",				-- Stun (Seal of Justice)
	[2878]   = "CC",				-- Turn Undead (rank 1)
	[5627]   = "CC",				-- Turn Undead (rank 2)
	[10326]  = "CC",				-- Turn Undead (rank 3)
	[20066]  = "CC",				-- Repentance (talent)
	[1044]   = "Other",				-- Blessing of Freedom

	----------------
	-- Priest
	----------------
	[15487]  = "Silence",			-- Silence (talent)
	[10060]  = "Other",				-- Power Infusion (talent)
	[15269]  = "CC",				-- Blackout (talent)
	[6346]   = "Other",				-- Fear Ward (!)
	[605]    = "CC",				-- Mind Control (rank 1)
	[10911]  = "CC",				-- Mind Control (rank 2)
	[10912]  = "CC",				-- Mind Control (rank 3)
	[8122]   = "CC",				-- Psychic Scream (rank 1)
	[8124]   = "CC",				-- Psychic Scream (rank 2)
	[10888]  = "CC",				-- Psychic Scream (rank 3)
	[10890]  = "CC",				-- Psychic Scream (rank 4)
	[9484]   = "CC",				-- Shackle Undead (rank 1)
	[9485]   = "CC",				-- Shackle Undead (rank 2)
	[10955]  = "CC",				-- Shackle Undead (rank 3)
	[15407]  = "Snare",				-- Mind Flay (talent) (rank 1)
	[17311]  = "Snare",				-- Mind Flay (talent) (rank 2)
	[17312]  = "Snare",				-- Mind Flay (talent) (rank 3)
	[17313]  = "Snare",				-- Mind Flay (talent) (rank 4)
	[17314]  = "Snare",				-- Mind Flay (talent) (rank 5)
	[18807]  = "Snare",				-- Mind Flay (talent) (rank 6)

	----------------
	-- Rogue
	----------------
	[2094]   = "CC",				-- Blind
	[408]    = "CC",				-- Kidney Shot (rank 1)
	[8643]   = "CC",				-- Kidney Shot (rank 2)
	[1833]   = "CC",				-- Cheap Shot
	[6770]   = "CC",				-- Sap (rank 1)
	[2070]   = "CC",				-- Sap (rank 2)
	[11297]  = "CC",				-- Sap (rank 3)
	[1776]   = "CC",				-- Gouge (rank 1)
	[1777]   = "CC",				-- Gouge (rank 2)
	[8629]   = "CC",				-- Gouge (rank 3)
	[11285]  = "CC",				-- Gouge (rank 4)
	[11286]  = "CC",				-- Gouge (rank 5)
	[5530]   = "CC",				-- Mace Stun (talent)
	[14251]  = "Disarm",			-- Riposte (talent)
	[18425]  = "Silence",			-- Kick - Silenced (talent)
	[3409]   = "Snare",				-- Crippling Poison (rank 1)
	[25809]  = "Snare",				-- Crippling Poison (rank 1)
	[11201]  = "Snare",				-- Crippling Poison (rank 2)
	[5277]   = "Other",				-- Evasion
	[14177]  = "Other",				-- Cold Blood (talent) (!)
	[13750]  = "Other",				-- Adrenaline Rush

	----------------
	-- Shaman
	----------------
	[8178]   = "ImmuneSpell",		-- Grounding Totem Effect (Grounding Totem) (!)
	[8056]   = "Snare",				-- Frost Shock (rank 1)
	[8058]   = "Snare",				-- Frost Shock (rank 2)
	[10472]  = "Snare",				-- Frost Shock (rank 3)
	[10473]  = "Snare",				-- Frost Shock (rank 4)
	[3600]   = "Snare",				-- Earthbind (Earthbind Totem)
	[16166]  = "Other",				-- Elemental Mastery (talent) (!)
	[16188]  = "Other",				-- Nature's Swiftness (talent) (!)

	----------------
	-- Warlock
	----------------
	[710]    = "CC",				-- Banish (rank 1)
	[18647]  = "CC",				-- Banish (rank 2)
	[5782]   = "CC",				-- Fear (rank 1)
	[6213]   = "CC",				-- Fear (rank 2)
	[6215]   = "CC",				-- Fear (rank 3)
	[5484]   = "CC",				-- Howl of Terror (rank 1)
	[17928]  = "CC",				-- Howl of Terror (rank 2)
	[6789]   = "CC",				-- Death Coil (rank 1)
	[17925]  = "CC",				-- Death Coil (rank 2)
	[17926]  = "CC",				-- Death Coil (rank 3)
	[22703]  = "CC",				-- Inferno Effect
	[18093]  = "CC",				-- Pyroclasm (talent)
	[18223]  = "Snare",				-- Curse of Exhaustion (talent)
	[18118]  = "Snare",				-- Aftermath (talent)
	[18708]  = "Other",				-- Fel Domination (talent) (!)

		----------------
		-- Warlock Pets
		----------------
		[24259]  = "Silence",		-- Spell Lock (Felhunter)
		[6358]   = "CC",			-- Seduction (Succubus)
		[4511]   = "Immune",		-- Phase Shift (Imp)
		[19482]  = "CC",			-- War Stomp (Doomguard)
		[89]     = "Snare",			-- Cripple (Doomguard)

	----------------
	-- Warrior
	----------------
	[7922]   = "CC",				-- Charge (rank 1/2/3)
	[20253]  = "CC",				-- Intercept (rank 1)
	[20614]  = "CC",				-- Intercept (rank 2)
	[20615]  = "CC",				-- Intercept (rank 3)
	[5246]   = "CC",				-- Intimidating Shout
	[20511]  = "CC",				-- Intimidating Shout
	[5530]   = "CC",				-- Mace Stun Effect (Mace Specialization talent)
	[12798]  = "CC",				-- Revenge Stun (Improved Revenge talent)
	[12809]  = "CC",				-- Concussion Blow (talent)
	[676]    = "Disarm",			-- Disarm
	[871]    = "Immune",			-- Shield Wall (not immune, 75% damage reduction)
	[23694]  = "Root",				-- Improved Hamstring (talent)
	[1715]   = "Snare",				-- Hamstring (rank 1)
	[7372]   = "Snare",				-- Hamstring (rank 2)
	[7373]   = "Snare",				-- Hamstring (rank 3)
	[12705]  = "Snare",				-- Long Daze (Improved Pummel)
	[12323]  = "Snare",				-- Piercing Howl (talent)
	[12328]  = "Other",				-- Death Wish (talent)
	[12976]  = "Other",				-- Last Stand (talent)
	[20230]  = "Other",				-- Retaliation (!)
	[18499]  = "Other",				-- Berserker Rage
	[1719]   = "Other",				-- Recklessness

	----------------
	-- Other
	----------------
	[56]     = "CC",				-- Stun (some weapons proc)
	[835]    = "CC",				-- Tidal Charm (trinket)
	[8312]   = "Root",				-- Trap (Hunting Net trinket)
	[17308]  = "CC",				-- Stun (Hurd Smasher fist weapon)
	[23454]  = "CC",				-- Stun (The Unstoppable Force weapon)
	[9179]   = "CC",				-- Stun (Tigule and Foror's Strawberry Ice Cream item)
	[7744]   = "Other",				-- Will of the Forsaken	(undead racial)
	[20594]  = "Other",				-- Stoneform (dwarf racial)
	[30217]  = "CC",				-- Adamantite Grenade
	[13327]  = "CC",				-- Reckless Charge (Goblin Rocket Helmet)
	[20549]  = "CC",				-- War Stomp (tauren racial)
	[13181]  = "CC",				-- Gnomish Mind Control Cap (Gnomish Mind Control Cap helmet)
	[26740]  = "CC",				-- Gnomish Mind Control Cap (Gnomish Mind Control Cap helmet)
	[8345]   = "CC",				-- Control Machine (Gnomish Universal Remote trinket)
	[5134]   = "CC",				-- Flash Bomb
	[4064]   = "CC",				-- Rough Copper Bomb
	[4065]   = "CC",				-- Large Copper Bomb
	[4066]   = "CC",				-- Small Bronze Bomb
	[4067]   = "CC",				-- Big Bronze Bomb
	[4068]   = "CC",				-- Iron Grenade
	[4069]   = "CC",				-- Big Iron Bomb
	[12543]  = "CC",				-- Hi-Explosive Bomb
	[12562]  = "CC",				-- The Big One
	[12421]  = "CC",				-- Mithril Frag Bomb
	[19784]  = "CC",				-- Dark Iron Bomb
	[19769]  = "CC",				-- Thorium Grenade
	[13808]  = "CC",				-- M73 Frag Grenade
	[13161]  = "CC",				-- Stun Bomb Attack
	[9159]   = "CC",				-- Sleep (Green Whelp Armor chest)
	[19821]  = "Silence",			-- Arcane Bomb
	--[9774]   = "Other",				-- Immune Root (spider belt)
	[18278]  = "Silence",			-- Silence (Silent Fang sword)
	[8346]   = "Root",				-- Mobility Malfunction (trinket)
	[13099]  = "Root",				-- Net-o-Matic (trinket)
	[13138]  = "Root",				-- Net-o-Matic (trinket)
	[16566]  = "Root",				-- Net-o-Matic (trinket)
	[15752]  = "Disarm",			-- Linken's Boomerang (trinket)
	[15753]  = "CC",				-- Linken's Boomerang (trinket)
	[15535]  = "CC",				-- Enveloping Winds (Six Demon Bag trinket)
	[23103]  = "CC",				-- Enveloping Winds (Six Demon Bag trinket)
	[25189]  = "CC",				-- Enveloping Winds (Six Demon Bag trinket)
	[15534]  = "CC",				-- Polymorph (Six Demon Bag trinket)
	[11538]  = "Snare",				-- Frostbolt
	[700]    = "CC",				-- Sleep (Slumber Sand item)
	[1090]   = "CC",				-- Sleep
	[12098]  = "CC",				-- Sleep
	[20663]  = "CC",				-- Sleep
	[20669]  = "CC",				-- Sleep
	[20989]  = "CC",				-- Sleep
	[24004]  = "CC",				-- Sleep
	[24664]  = "CC",				-- Sleep
	[29848]  = "CC",				-- Polymorph
	[29124]  = "CC",				-- Polymorph
	[14621]  = "CC",				-- Polymorph
	[27760]  = "CC",				-- Polymorph
	[28406]  = "CC",				-- Polymorph Backfire
	[851]    = "CC",				-- Polymorph: Sheep
	[17172]  = "CC",				-- Hex
	[24053]  = "CC",				-- Hex
	[16707]  = "CC",				-- Hex
	[16708]  = "CC",				-- Hex
	[16709]  = "CC",				-- Hex
	[20683]  = "CC",				-- Highlord's Justice
	[17286]  = "CC",				-- Crusader's Hammer
	[17820]  = "Other",				-- Veil of Shadow
	[12096]  = "CC",				-- Fear
	[26070]  = "CC",				-- Fear
	[26580]  = "CC",				-- Fear
	[27641]  = "CC",				-- Fear
	[27990]  = "CC",				-- Fear
	[29168]  = "CC",				-- Fear
	[30002]  = "CC",				-- Fear
	[12748]  = "Root",				-- Frost Nova
	[14907]  = "Root",				-- Frost Nova
	[22645]  = "Root",				-- Frost Nova
	[29849]  = "Root",				-- Frost Nova
	[30094]  = "Root",				-- Frost Nova
	[15091]  = "Snare",				-- Blast Wave
	[17277]  = "Snare",				-- Blast Wave
	[23039]  = "Snare",				-- Blast Wave
	[23113]  = "Snare",				-- Blast Wave
	[30092]  = "Snare",				-- Blast Wave
	[16053]  = "CC",				-- Dominion of Soul (Orb of Draconic Energy)
	[15859]  = "CC",				-- Dominate Mind
	[20740]  = "CC",				-- Dominate Mind
	[11446]  = "CC",				-- Mind Control
	[21330]  = "CC",				-- Corrupted Fear (Deathmist Raiment set)
	[26108]  = "CC",				-- Glimpse of Madness (Dark Edge of Insanity axe)
	[18803]  = "Other",				-- Focus (Hand of Edward the Odd mace)
	[1604]   = "Snare",				-- Dazed
	[30504]  = "CC",				-- Poultryized! (trinket)
	[30501]  = "CC",				-- Poultryized! (trinket)
	[30506]  = "CC",				-- Poultryized! (trinket)
	[24753]  = "CC",				-- Trick
	[15822]  = "CC",				-- Dreamless Sleep Potion
	[16600]  = "CC",				-- Might of Shahram (Blackblade of Shahram sword)
	[16597]  = "Snare",				-- Curse of Shahram (Blackblade of Shahram sword)
	[13496]  = "Snare",				-- Dazed (Mug O' Hurt mace)
	[6615]   = "Other",				-- Free Action Potion
	[24364]  = "Other",				-- Living Free Action
	[3169]   = "ImmunePhysical",	-- Limited Invulnerability Potion
	[17624]  = "Immune",			-- Flask of Petrification
	[13534]  = "Disarm",			-- Disarm (The Shatterer weapon)
	[13439]  = "Snare",				-- Frostbolt (some weapons)
	[16621]  = "ImmunePhysical",	-- Self Invulnerability (Invulnerable Mail weapon)
	[27559]  = "Silence",			-- Silence (Jagged Obsidian Shield weapon)
	[13907]  = "CC",				-- Smite Demon (Enchant Weapon - Demonslaying)
	--[16927]  = "Snare",				-- Chilled (Frostguard weapon)
	--[20005]  = "Snare",				-- Chilled (Enchant Weapon - Icy Chill)

	-- PvE
	--[123456] = "PvE",				-- This is just an example, not a real spell
	------------------------
	---- PVE CLASSIC
	------------------------
	-- Molten Core Raid
	-- -- Trash
	[19364]  = "CC",				-- Ground Stomp
	[19369]  = "CC",				-- Ancient Despair
	[19641]  = "CC",				-- Pyroclast Barrage
	[20276]  = "CC",				-- Knockdown
	[19393]  = "Silence",			-- Soul Burn
	[19636]  = "Root",				-- Fire Blossom
	-- -- Lucifron
	[20604]  = "CC",				-- Dominate Mind
	-- -- Magmadar
	[19408]  = "CC",				-- Panic
	-- -- Gehennas
	[20277]  = "CC",				-- Fist of Ragnaros
	[19716]  = "Other",				-- Gehennas' Curse
	-- -- Garr
	[19496]  = "Snare",				-- Magma Shackles
	-- -- Shazzrah
	[19714]  = "ImmuneSpell",		-- Deaden Magic (not immune, 50% magical damage reduction)
	-- -- Golemagg the Incinerator
	[19820]  = "Snare",				-- Mangle
	[22689]  = "Snare",				-- Mangle
	-- -- Sulfuron Harbinger
	[19780]  = "CC",				-- Hand of Ragnaros
	-- -- Majordomo Executus
	[20619]  = "ImmuneSpell",		-- Magic Reflection (not immune, 50% chance reflect spells)
	[20229]  = "Snare",				-- Blast Wave
	------------------------
	-- Onyxia's Lair Raid
	-- -- Onyxia
	[18431]  = "CC",				-- Bellowing Roar
	------------------------
	-- Blackwing Lair Raid
	-- -- Trash
	[24375]  = "CC",				-- War Stomp
	[22289]  = "CC",				-- Brood Power: Green
	[22291]  = "CC",				-- Brood Power: Bronze
	[22561]  = "CC",				-- Brood Power: Green
	[22247]  = "Snare",				-- Suppression Aura
	[22424]  = "Snare",				-- Blast Wave
	[15548]  = "Snare",				-- Thunderclap
	-- -- Razorgore the Untamed
	[19872]  = "CC",				-- Calm Dragonkin
	[23023]  = "CC",				-- Conflagration
	[15593]  = "CC",				-- War Stomp
	[16740]  = "CC",				-- War Stomp
	[27758]  = "CC",				-- War Stomp
	[28725]  = "CC",				-- War Stomp
	[14515]  = "CC",				-- Dominate Mind
	[22274]  = "CC",				-- Greater Polymorph
	[13747]  = "Snare",				-- Slow
	-- -- Broodlord Lashlayer
	[23331]  = "Snare",				-- Blast Wave
	[25049]  = "Snare",				-- Blast Wave
	-- -- Chromaggus
	[23310]  = "CC",				-- Time Lapse
	[23312]  = "CC",				-- Time Lapse
	[23174]  = "CC",				-- Chromatic Mutation
	[23171]  = "CC",				-- Time Stop (Brood Affliction: Bronze)
	[23153]  = "Snare",				-- Brood Affliction: Blue
	[23169]  = "Other",				-- Brood Affliction: Green
	-- -- Nefarian
	[22666]  = "Silence",			-- Silence
	[22667]  = "CC",				-- Shadow Command
	[22663]  = "Immune",			-- Nefarian's Barrier
	[22686]  = "CC",				-- Bellowing Roar
	[22678]  = "CC",				-- Fear
	[23603]  = "CC",				-- Wild Polymorph
	[23364]  = "CC",				-- Tail Lash
	[25654]  = "CC",				-- Tail Lash
	[23365]  = "Disarm",			-- Dropped Weapon
	[23415]  = "Immune",			-- Improved Blessing of Protection
	[23414]  = "Root",				-- Paralyze
	[22687]  = "Other",				-- Veil of Shadow
	------------------------
	-- Classic World Bosses
	-- -- Azuregos
	[23182]  = "CC",				-- Mark of Frost
	[22067]  = "ImmuneSpell",		-- Reflection
	[27564]  = "ImmuneSpell",		-- Reflection
	[21098]  = "Snare",				-- Chill
	-- -- Doom Lord Kazzak & Highlord Kruul
	[8078]   = "Snare",				-- Thunderclap
	[23931]  = "Snare",				-- Thunderclap
	-- -- Dragons of Nightmare
	[25043]  = "CC",				-- Aura of Nature
	[24778]  = "CC",				-- Sleep (Dream Fog)
	[24811]  = "CC",				-- Draw Spirit
	[25806]  = "CC",				-- Creature of Nightmare
	[12528]  = "Silence",			-- Silence
	[23207]  = "Silence",			-- Silence
	[26069]  = "Silence",			-- Silence
	[29943]  = "Silence",			-- Silence
	[30225]  = "Silence",			-- Silence
	------------------------
	-- Classic Dungeons
	-- -- Ragefire Chasm
	[8242]   = "CC",				-- Shield Slam
	-- -- The Deadmines
	[6304]   = "CC",				-- Rhahk'Zor Slam
	[6713]   = "Disarm",			-- Disarm
	[7399]   = "CC",				-- Terrify
	[5213]   = "Snare",				-- Molten Metal
	[6435]   = "CC",				-- Smite Slam
	[6432]   = "CC",				-- Smite Stomp
	[6264]   = "Other",				-- Nimble Reflexes (chance to parry increased by 75%)
	[113]    = "Root",				-- Chains of Ice
	[5159]   = "Snare",				-- Melt Ore
	[228]    = "CC",				-- Polymorph: Chicken
	[6466]   = "CC",				-- Axe Toss
	-- -- Wailing Caverns
	[8040]   = "CC",				-- Druid's Slumber
	[8147]   = "Snare",				-- Thunderclap
	[8142]   = "Root",				-- Grasping Vines
	[5164]   = "CC",				-- Knockdown
	[7967]   = "CC",				-- Naralex's Nightmare
	[8150]   = "CC",				-- Thundercrack
	-- -- Shadowfang Keep
	[7295]   = "Root",				-- Soul Drain
	[7139]   = "CC",				-- Fel Stomp
	[13005]  = "CC",				-- Hammer of Justice
	[9080]   = "Snare",				-- Hamstring
	[7621]   = "CC",				-- Arugal's Curse
	[7068]   = "Other",				-- Veil of Shadow
	[23224]  = "Other",				-- Veil of Shadow
	[7803]   = "CC",				-- Thundershock
	[7074]   = "Silence",			-- Screams of the Past
	[24021]  = "ImmuneSpell",		-- Anti-Magic Shield
	-- -- Blackfathom Deeps
	[246]    = "Snare",				-- Slow
	[15531]  = "Root",				-- Frost Nova
	[6533]   = "Root",				-- Net
	[8399]   = "CC",				-- Sleep
	[8379]   = "Disarm",			-- Disarm
	[18972]  = "Snare",				-- Slow
	[9672]   = "Snare",				-- Frostbolt
	[8398]   = "Snare",				-- Frostbolt Volley
	[8391]   = "CC",				-- Ravage
	[7645]   = "CC",				-- Dominate Mind
	[15043]  = "Snare",				-- Frostbolt
	-- -- The Stockade
	[3419]   = "Other",				-- Improved Blocking
	[7964]   = "CC",				-- Smoke Bomb
	[19134]  = "CC",				-- Intimidating Shout
	[29544]  = "CC",				-- Intimidating Shout
	[6253]   = "CC",				-- Backhand
	-- -- Gnomeregan
	[10831]  = "ImmuneSpell",		-- Reflection Field
	[11820]  = "Root",				-- Electrified Net
	[10734]  = "Snare",				-- Hail Storm
	[11264]  = "Root",				-- Ice Blast
	[10730]  = "CC",				-- Pacify
	-- -- Razorfen Kraul
	[8281]   = "Silence",			-- Sonic Burst
	[23918]  = "Silence",			-- Sonic Burst
	[39052]  = "Silence",			-- Sonic Burst
	[8359]   = "CC",				-- Left for Dead
	[8285]   = "CC",				-- Rampage
	[8361]   = "Immune",			-- Purity
	[8377]   = "Root",				-- Earthgrab
	[6984]   = "Snare",				-- Frost Shot
	[6985]   = "Snare",				-- Frost Shot
	[18802]  = "Snare",				-- Frost Shot
	[6728]   = "CC",				-- Enveloping Winds
	[3248]   = "Other",				-- Improved Blocking
	[6524]   = "CC",				-- Ground Tremor
	-- -- Scarlet Monastery
	[9438]   = "Immune",			-- Arcane Bubble
	[13323]  = "CC",				-- Polymorph
	[8988]   = "Silence",			-- Silence
	[8989]   = "ImmuneSpell",		-- Whirlwind
	[13874]  = "Immune",			-- Divine Shield
	[9256]   = "CC",				-- Deep Sleep
	[3639]   = "Other",				-- Improved Blocking
	[6146]   = "Snare",				-- Slow
	-- -- Razorfen Downs
	[12252]  = "Root",				-- Web Spray
	[15530]  = "Snare",				-- Frostbolt
	[12946]  = "Silence",			-- Putrid Stench
	[745]    = "Root",				-- Web
	[11443]  = "Snare",				-- Cripple
	[11436]  = "Snare",				-- Slow
		-- (limited information, needs a future update)
	-- -- Uldaman
	[11876]  = "CC",				-- War Stomp
	[3636]   = "CC",				-- Crystalline Slumber
	[9906]   = "ImmuneSpell",		-- Reflection
	[6726]   = "Silence",			-- Silence
		-- (limited information, needs a future update)
	-- -- Maraudon
	[12747]  = "Root",				-- Entangling Roots
	[21331]  = "Root",				-- Entangling Roots
	[21793]  = "Snare",				-- Twisted Tranquility
	[21808]  = "CC",				-- Summon Shardlings
	[29419]  = "CC",				-- Flash Bomb
	[22592]  = "CC",				-- Knockdown
	[21869]  = "CC",				-- Repulsive Gaze
	[11428]  = "CC",				-- Knockdown
	[16790]  = "CC",				-- Knockdown
	[11922]  = "Root",				-- Entangling Roots
		-- (limited information, needs a future update)
	-- -- Zul'Farrak
	[11020]  = "CC",				-- Petrify
	[13704]  = "CC",				-- Psychic Scream
	[11089]  = "ImmunePhysical",	-- Theka Transform
	[12551]  = "Snare",				-- Frost Shot
	[11836]  = "CC",				-- Freeze Solid
	[11131]  = "Snare",				-- Icicle
	[11641]  = "CC",				-- Hex
	[12540]  = "CC",				-- Gouge
		-- (limited information, needs a future update)
	-- -- The Temple of Atal'Hakkar (Sunken Temple)
	[12888]  = "CC",				-- Cause Insanity
	[24327]  = "CC",				-- Cause Insanity
	[26079]  = "CC",				-- Cause Insanity
	[12480]  = "CC",				-- Hex of Jammal'an
	[12890]  = "CC",				-- Deep Slumber
	[25852]  = "CC",				-- Lash
	[6607]   = "CC",				-- Lash
	[6608]   = "Disarm",			-- Dropped Weapon
	[25774]  = "CC",				-- Mind Shatter
		-- (limited information, needs a future update) (!)
	-- -- Blackrock Depths
	[8994]   = "CC",				-- Banish
	[15588]  = "Snare",				-- Thunderclap
	[12674]  = "Root",				-- Frost Nova
	[12675]  = "Snare",				-- Frostbolt
	[15244]  = "Snare",				-- Cone of Cold
	[15636]  = "ImmuneSpell",		-- Avatar of Flame
	[7121]   = "ImmuneSpell",		-- Anti-Magic Shield
	[15471]  = "Silence",			-- Enveloping Web
	[3609]   = "CC",				-- Paralyzing Poison
	[15474]  = "Root",				-- Web Explosion
	[17492]  = "CC",				-- Hand of Thaurissan
	[12169]  = "Other",				-- Shield Block
	[14030]  = "Root",				-- Hooked Net
	[14870]  = "CC",				-- Drunken Stupor
	[13902]  = "CC",				-- Fist of Ragnaros
	[15063]  = "Root",				-- Frost Nova
	[6945]   = "CC",				-- Chest Pains
	[3551]   = "CC",				-- Skull Crack
	[15621]  = "CC",				-- Skull Crack
	[11831]  = "Root",				-- Frost Nova
	[15499]  = "Snare",				-- Frost Shock
		-- (limited information, needs a future update)
	-- -- Blackrock Spire
	[16097]  = "CC",				-- Hex
	[22566]  = "CC",				-- Hex
	[15618]  = "CC",				-- Snap Kick
	[16075]  = "CC",				-- Throw Axe
	[16104]  = "CC",				-- Crystallize
	[16508]  = "CC",				-- Intimidating Roar
	[15609]  = "Root",				-- Hooked Net
	[16497]  = "CC",				-- Stun Bomb
	[5276]   = "CC",				-- Freeze
	[18763]  = "CC",				-- Freeze
	[18798]  = "CC",				-- Freeze
	[27868]  = "CC",				-- Freeze
	[16805]  = "CC",				-- Conflagration
	[13579]  = "CC",				-- Gouge
	[24698]  = "CC",				-- Gouge
	[28456]  = "CC",				-- Gouge
	[16046]  = "Snare",				-- Blast Wave
	[15744]  = "Snare",				-- Blast Wave
	[15532]  = "Root",				-- Frost Nova
		-- (limited information, needs a future update)
	-- -- Stratholme
	[17405]  = "CC",				-- Domination
	[15655]  = "CC",				-- Shield Slam
	[19645]  = "ImmuneSpell",		-- Anti-Magic Shield
	[16799]  = "Snare",				-- Frostbolt
	[16798]  = "CC",				-- Enchanting Lullaby
	[12542]  = "CC",				-- Fear
	[12734]  = "CC",				-- Ground Smash
	[17293]  = "CC",				-- Burning Winds
	[4962]   = "Root",				-- Encasing Webs
	[13322]  = "Snare",				-- Frostbolt
	[16869]  = "CC",				-- Ice Tomb
	[17244]  = "CC",				-- Possess
	[18327]  = "Silence",			-- Silence
	[17307]  = "CC",				-- Knockout
	[15970]  = "CC",				-- Sleep
		-- (limited information, needs a future update)
	-- -- Dire Maul
	[17145]  = "Snare",				-- Blast Wave
	[21060]  = "CC",				-- Blind
	[12540]  = "CC",				-- Gouge
	[22651]  = "CC",				-- Sacrifice
	[22419]  = "Disarm",			-- Riptide
	[22691]  = "Disarm",			-- Disarm
	[22833]  = "CC",				-- Booze Spit (chance to hit reduced by 75%)
	[22856]  = "CC",				-- Ice Lock
	[16727]  = "CC",				-- War Stomp
	[22884]  = "CC",				-- Psychic Scream
	[22994]  = "Root",				-- Entangle
	[22924]  = "Root",				-- Grasping Vines
	[22914]  = "Snare",				-- Concussive Shot
	[22915]  = "CC",				-- Improved Concussive Shot
	[22919]  = "Snare",				-- Mind Flay
	[22909]  = "Snare",				-- Eye of Immol'thar
	[28858]  = "Root",				-- Entangling Roots
	[22415]  = "Root",				-- Entangling Roots
	[22744]  = "Root",				-- Chains of Ice
	[12611]  = "Snare",				-- Cone of Cold
	[16838]  = "Silence",			-- Banshee Shriek
	[22519]  = "Root",				-- Ice Nova
	[22356]  = "Snare",				-- Slow
		-- (limited information, needs a future update)
	-- -- Scholomance
	[27565]  = "Immune",			-- Banish
	[18099]  = "Snare",				-- Chill Nova
	[16350]  = "CC",				-- Freeze
	[22643]  = "Snare",				-- Frostbolt Volley
	[18101]  = "Snare",				-- Chilled (Frost Armor)
		-- (limited information, needs a future update) (!)
}

if debug then
	for k in pairs(spellIds) do
		local name, _, icon = GetSpellInfo(k)
		if not name then print(addonName, ": No spell name", k) end
		if not icon then print(addonName, ": No spell icon", k) end
	end
end

-------------------------------------------------------------------------------
-- Global references for attaching icons to various unit frames
local anchors = {
	None = {}, -- empty but necessary
	Blizzard = {
		player = "PlayerPortrait",
		pet    = "PetPortrait",
		target = "TargetFramePortrait",
		party1 = "PartyMemberFrame1Portrait",
		party2 = "PartyMemberFrame2Portrait",
		party3 = "PartyMemberFrame3Portrait",
		party4 = "PartyMemberFrame4Portrait",
		--party1pet = "PartyMemberFrame1PetFramePortrait",
		--party2pet = "PartyMemberFrame2PetFramePortrait",
		--party3pet = "PartyMemberFrame3PetFramePortrait",
		--party4pet = "PartyMemberFrame4PetFramePortrait",
	},
	Perl = {
		player = "Perl_Player_Portrait",
		pet    = "Perl_Player_Pet_Portrait",
		target = "Perl_Target_Portrait",
		party1 = "Perl_Party_MemberFrame1_Portrait",
		party2 = "Perl_Party_MemberFrame2_Portrait",
		party3 = "Perl_Party_MemberFrame3_Portrait",
		party4 = "Perl_Party_MemberFrame4_Portrait",
	},
	XPerl = {
		player = "XPerl_PlayerportraitFrameportrait",
		pet    = "XPerl_Player_PetportraitFrameportrait",
		target = "XPerl_TargetportraitFrameportrait",
		party1 = "XPerl_party1portraitFrameportrait",
		party2 = "XPerl_party2portraitFrameportrait",
		party3 = "XPerl_party3portraitFrameportrait",
		party4 = "XPerl_party4portraitFrameportrait",
	},
	LUI = {
		player = "oUF_LUI_player",
		pet    = "oUF_LUI_pet",
		target = "oUF_LUI_target",
		party1 = "oUF_LUI_partyUnitButton1",
		party2 = "oUF_LUI_partyUnitButton2",
		party3 = "oUF_LUI_partyUnitButton3",
		party4 = "oUF_LUI_partyUnitButton4",
	},
	--SUF = {
	--	player = SUFUnitplayer.portraitModel.portrait,
	--	pet    = SUFUnitpet.portraitModel.portrait,
	--	target = SUFUnittarget.portraitModel.portrait,
	--	party1 = SUFUnitparty1.portraitModel.portrait, -- SUFHeaderpartyUnitButton1 ?
	--	party2 = SUFUnitparty2.portraitModel.portrait,
	--	party3 = SUFUnitparty3.portraitModel.portrait,
	--	party4 = SUFUnitparty4.portraitModel.portrait,
	--},
	-- more to come here?
}

-------------------------------------------------------------------------------
-- Default settings
local DBdefaults = {
	version = 1.0, -- This is the settings version, not necessarily the same as the LoseControl version
	noCooldownCount = false,
	noGetExtraAuraDurationInformation = false,
	noGetEnemiesBuffsInformation = false,
	noBlizzardCooldownCount = true,
	disablePartyInBG = false,
	disablePartyInRaid = true,
	disablePlayerInterrupts = true,
	priority = {		-- higher numbers have more priority; 0 = disabled
		PvE = 90,
		Immune = 80,
		ImmuneSpell	= 70,
		ImmunePhysical = 65,
		CC = 60,
		Silence = 50,
		Interrupt = 40,
		Disarm = 30,
		Other = 0,
		Root = 0,
		Snare = 0,
	},
	frames = {
		player = {
			enabled = true,
			size = 36,
			alpha = 1,
			anchor = "None",
		},
		pet = {
			enabled = true,
			size = 36,
			alpha = 1,
			anchor = "Blizzard",
		},
		target = {
			enabled = true,
			size = 56,
			alpha = 1,
			anchor = "Blizzard",
		},
		party1 = {
			enabled = true,
			size = 36,
			alpha = 1,
			anchor = "Blizzard",
		},
		party2 = {
			enabled = true,
			size = 36,
			alpha = 1,
			anchor = "Blizzard",
		},
		party3 = {
			enabled = true,
			size = 36,
			alpha = 1,
			anchor = "Blizzard",
		},
		party4 = {
			enabled = true,
			size = 36,
			alpha = 1,
			anchor = "Blizzard",
		},
	},
}
local LoseControlDB -- local reference to the addon settings. this gets initialized when the ADDON_LOADED event fires

-------------------------------------------------------------------------------
-- Create the main class
local LoseControl = CreateFrame("Cooldown", nil, UIParent, "CooldownFrameTemplate") -- Exposes the SetCooldown method

function LoseControl:OnEvent(event, ...) -- functions created in "object:method"-style have an implicit first parameter of "self", which points to object
	self[event](self, ...) -- route event parameters to LoseControl:event methods
end
LoseControl:SetScript("OnEvent", LoseControl.OnEvent)

-- Utility function to handle registering for unit events
function LoseControl:RegisterUnitEvents(enabled)
	local unitId = self.unitId
	if debug then print("RegisterUnitEvents", unitId, enabled) end
	if enabled then
		self:RegisterUnitEvent("UNIT_AURA", unitId)
		if (LoseControlDB.priority.Interrupt > 0) then
			self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		end
		if unitId == "target" then
			self:RegisterEvent("PLAYER_TARGET_CHANGED")
		elseif unitId == "pet" then
			self:RegisterUnitEvent("UNIT_PET", "player")
		end
	else
		self:UnregisterEvent("UNIT_AURA")
		self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		if unitId == "target" then
			self:UnregisterEvent("PLAYER_TARGET_CHANGED")
		elseif unitId == "pet" then
			self:UnregisterEvent("UNIT_PET")
		end
	end
end

-- Function to enable/disable the enemies buff tracking
function LoseControl:UpdateGetEnemiesBuffInformationOptionState()
	if LoseControlDB.noGetEnemiesBuffsInformation then
		LibClassicDurations.UnregisterCallback(addonName, "UNIT_BUFF")
	else
		LibClassicDurations.RegisterCallback(addonName, "UNIT_BUFF", function(event, unitId)
			local frame = LCframes[unitId]
			if frame then
				local inInstance, instanceType = IsInInstance()
				local enabled = frame.frame.enabled and not (
					inInstance and instanceType == "pvp" and (
						( LoseControlDB.disablePartyInBG and string.find(unitId, "party") )
					)
				) and not (
					IsInRaid() and LoseControlDB.disablePartyInRaid and string.find(unitId, "party")
				)
				if enabled then
					frame:UNIT_AURA(unitId)
				end
			end
		end)
	end
end

-- Function to update the interruptsSpellIdByName table
function LoseControl:UpdateInterruptsSpellIdByNameTable()
	for k, v in pairs(interruptsIds) do
		local spellName = GetSpellInfo(k)
		if (spellName ~= nil) then
			if (interruptsSpellIdByName[spellName] ~= nil) then
				if (v[2] > interruptsIds[interruptsSpellIdByName[spellName]][2]) then
					interruptsSpellIdByName[spellName] = k
				end
			else
				interruptsSpellIdByName[spellName] = k
			end
			
		end
	end
end

-- Handle default settings
function LoseControl:ADDON_LOADED(arg1)
	if arg1 == addonName then
		if (_G.LoseControlDB == nil) or (_G.LoseControlDB.version == nil) then
			_G.LoseControlDB = CopyTable(DBdefaults)
			print(L["LoseControl reset."])
		end
		LoseControlDB = _G.LoseControlDB
		self.noCooldownCount = LoseControlDB.noCooldownCount
		self.noBlizzardCooldownCount = LoseControlDB.noBlizzardCooldownCount
		self.noGetExtraAuraDurationInformation = LoseControlDB.noGetExtraAuraDurationInformation
		self.noGetEnemiesBuffsInformation = LoseControlDB.noGetEnemiesBuffsInformation
		if LoseControlDB.noCooldownCount then
			self:SetHideCountdownNumbers(LoseControlDB.noBlizzardCooldownCount)
			for _, v in pairs(LCframes) do
				v:SetHideCountdownNumbers(LoseControlDB.noBlizzardCooldownCount)
			end
		else
			self:SetHideCountdownNumbers(true)
			for _, v in pairs(LCframes) do
				v:SetHideCountdownNumbers(true)
			end
		end
		self:UpdateGetEnemiesBuffInformationOptionState()
		self:UpdateInterruptsSpellIdByNameTable()
		playerGUID = UnitGUID("player")
		_, _, playerClass = UnitClass("player")
	end
end

LoseControl:RegisterEvent("ADDON_LOADED")

-- Initialize a frame's position and register for events
function LoseControl:PLAYER_ENTERING_WORLD()
	local unitId = self.unitId
	self.frame = LoseControlDB.frames[unitId] -- store a local reference to the frame's settings
	local frame = self.frame
	local inInstance, instanceType = IsInInstance()
	self:RegisterUnitEvents(
		frame.enabled and not (
			inInstance and instanceType == "pvp" and (
				( LoseControlDB.disablePartyInBG and string.find(unitId, "party") )
			)
		) and not (
			IsInRaid() and LoseControlDB.disablePartyInRaid and string.find(unitId, "party")
		)
	)
	self.anchor = _G[anchors[frame.anchor][unitId]] or UIParent
	self.unitGUID = UnitGUID(self.unitId)
	self.parent:SetParent(self.anchor:GetParent()) -- or LoseControl) -- If Hide() is called on the parent frame, its children are hidden too. This also sets the frame strata to be the same as the parent's.
	--self:SetFrameStrata(frame.strata or "LOW")
	self:ClearAllPoints() -- if we don't do this then the frame won't always move
	self:SetWidth(frame.size)
	self:SetHeight(frame.size)
	self:SetPoint(
		frame.point or "CENTER",
		self.anchor,
		frame.relativePoint or "CENTER",
		frame.x or 0,
		frame.y or 0
	)
	--self:SetAlpha(frame.alpha) -- doesn't seem to work; must manually set alpha after the cooldown is displayed, otherwise it doesn't apply.
	self:Hide()
end

function LoseControl:GROUP_ROSTER_UPDATE()
	local unitId = self.unitId
	local frame = self.frame
	if (frame == nil) or (unitId == nil) or not(string.find(unitId, "party")) then
		return
	end
	local inInstance, instanceType = IsInInstance()
	self:RegisterUnitEvents(
		frame.enabled and not (
			inInstance and instanceType == "pvp" and LoseControlDB.disablePartyInBG
		) and not (
			IsInRaid() and LoseControlDB.disablePartyInRaid
		)
	)
	self.unitGUID = UnitGUID(self.unitId)
end

function LoseControl:GROUP_JOINED()
	self:GROUP_ROSTER_UPDATE()
end

function LoseControl:GROUP_LEFT()
	self:GROUP_ROSTER_UPDATE()
end

-- This event check pvp interrupts
function LoseControl:COMBAT_LOG_EVENT_UNFILTERED()
	if (UnitIsPlayer(self.unitId)) then
		local _, event, _, _, sourceGUID, sourceFlags, _, destGUID, _, _, _, spellId, spellName, _, _, _, spellSchool = CombatLogGetCurrentEventInfo()
		if (destGUID == self.unitGUID) then
			if (event == "SPELL_INTERRUPT") then
				if ((spellId == 0) and ((sourceFlags == nil) or (bit.band(sourceFlags, COMBATLOG_OBJECT_CONTROL_NPC) <= 0))) then
					spellId = interruptsSpellIdByName[spellName]
					-- exception for Iron Knuckles Pummel (spellId=13491), Warrior Pummel has higher priority (Warrior Pummel spellId=6554)
					if ((spellId == 6554) and (playerGUID ~= nil) and (sourceGUID ~= nil)) then
						if (playerGUID == sourceGUID) then
							if ((playerClass ~= nil) and (playerClass > 1)) then
								local itemIdMainHand = GetInventoryItemID("player", 16);
								local itemIdOffHand = GetInventoryItemID("player", 17);
								if ((itemIdMainHand == 2942) or (itemIdOffHand == 2942)) then
									spellId = 13491
								end
							end
						elseif (sourceFlags ~= nil) then
							local _, engClass = GetPlayerInfoByGUID(sourceGUID)
							if ((engClass ~= nil) and (engClass ~= "WARRIOR")) then
								spellId = 13491
							end
						end
					end
				end
				if (spellId > 0) then
					local infoInterrupt = interruptsIds[spellId]
					if (infoInterrupt ~= nil) then
						local duration = infoInterrupt[1]
						local expirationTime = GetTime() + duration
						local priority = LoseControlDB.priority.Interrupt
						local _, _, icon = GetSpellInfo(spellId)
						if (InterruptAuras[self.unitGUID] == nil) then
							InterruptAuras[self.unitGUID] = {}
						end
						table.insert(InterruptAuras[self.unitGUID], { ["spellId"] = spellId, ["duration"] = duration, ["expirationTime"] = expirationTime, ["priority"] = priority, ["icon"] = icon, ["spellSchool"] = spellSchool })
						self:UNIT_AURA(self.unitId)
					end
				end
			end
		end
	end
end

-- This is the main event. Check for (de)buffs and update the frame icon and cooldown.
function LoseControl:UNIT_AURA(unitId) -- fired when a (de)buff is gained/lost
	if not self.anchor:IsVisible() then return end
	local priority = LoseControlDB.priority
	local maxPriority = 1
	local maxExpirationTime = 0
	local Icon, Duration
	local forceEventUnitAuraAtEnd = false

	-- Check debuffs
	for i = 1, 40 do
		local localForceEventUnitAuraAtEnd = false
		local name, icon, _, _, duration, expirationTime, unitCaster, _, _, spellId = UnitAura(unitId, i, "HARMFUL")
		if not spellId then break end -- no more debuffs, terminate the loop
		if debug then print(unitId, "debuff", i, ")", name, "|", duration, "|", expirationTime, "|", spellId) end
		
		if duration == 0 and expirationTime == 0 then
			if not LoseControlDB.noGetExtraAuraDurationInformation then
				local durationNew, expirationTimeNew = LibClassicDurations:GetAuraDurationByUnit(unitId, spellId, unitCaster, name)
				if durationNew then
					duration = durationNew
					expirationTime = expirationTimeNew
				end
				if duration == 0 and expirationTime == 0 then
					expirationTime = GetTime() + 1 -- normal expirationTime = 0
				elseif expirationTime > 0 then
					localForceEventUnitAuraAtEnd = true
				end
			else
				expirationTime = GetTime() + 1 -- normal expirationTime = 0
			end
		end
		
		local Priority = priority[spellIds[spellId]]
		if Priority then
			if Priority == maxPriority and expirationTime > maxExpirationTime then
				maxExpirationTime = expirationTime
				Duration = duration
				Icon = icon
				forceEventUnitAuraAtEnd = localForceEventUnitAuraAtEnd
			elseif Priority > maxPriority then
				maxPriority = Priority
				maxExpirationTime = expirationTime
				Duration = duration
				Icon = icon
				forceEventUnitAuraAtEnd = localForceEventUnitAuraAtEnd
			end
		end
	end

	-- Check buffs
	if unitId ~= "player" and (priority.Immune > 0 or priority.ImmuneSpell > 0 or priority.ImmunePhysical > 0 or priority.Other > 0) then
		for i = 1, 40 do
			local localForceEventUnitAuraAtEnd = false
			local name, icon, duration, expirationTime, spellId
			if LoseControlDB.noGetEnemiesBuffsInformation then
				name, icon, _, _, duration, expirationTime, _, _, _, spellId = UnitAura(unitId, i, "HELPFUL")
				
				if not spellId then break end
				if debug then print(unitId, "buff", i, ")", name, "|", duration, "|", expirationTime, "|", spellId) end
				
				if duration == 0 and expirationTime == 0 then
					if not LoseControlDB.noGetExtraAuraDurationInformation then
						local durationNew, expirationTimeNew = LibClassicDurations:GetAuraDurationByUnit(unitId, spellId, unitCaster, name)
						if durationNew then
							duration = durationNew
							expirationTime = expirationTimeNew
						end
						if duration == 0 and expirationTime == 0 then
							expirationTime = GetTime() + 1 -- normal expirationTime = 0
						elseif expirationTime > 0 then
							localForceEventUnitAuraAtEnd = true
						end
					else
						expirationTime = GetTime() + 1 -- normal expirationTime = 0
					end
				end
				
			else
				name, icon, _, _, duration, expirationTime, _, _, _, spellId = LibClassicDurations:UnitAura(unitId, i, "HELPFUL")
				
				if not spellId then break end
				if debug then print(unitId, "buff", i, ")", name, "|", duration, "|", expirationTime, "|", spellId) end
				
				if duration == 0 and expirationTime == 0 then
					expirationTime = GetTime() + 1 -- normal expirationTime = 0
				elseif expirationTime > 0 then
					localForceEventUnitAuraAtEnd = true
				end
			end
			
			local Priority = priority[spellIds[spellId]]
			if Priority then
				if Priority == maxPriority and expirationTime > maxExpirationTime then
					maxExpirationTime = expirationTime
					Duration = duration
					Icon = icon
					forceEventUnitAuraAtEnd = localForceEventUnitAuraAtEnd
				elseif Priority > maxPriority then
					maxPriority = Priority
					maxExpirationTime = expirationTime
					Duration = duration
					Icon = icon
					forceEventUnitAuraAtEnd = localForceEventUnitAuraAtEnd
				end
			end
		end
	end
	
	-- Check interrupts
	if ((self.unitGUID ~= nil) and (priority.Interrupt > 0) and ((unitId ~= "player") or (not LoseControlDB.disablePlayerInterrupts))) then
		if (InterruptAuras[self.unitGUID] ~= nil) then
			for k, v in ipairs(InterruptAuras[self.unitGUID]) do
				local spellId = v.spellId
				local Priority = v.priority
				local expirationTime = v.expirationTime
				local duration = v.duration
				local icon = v.icon
				local spellSchool = v.spellSchool
				if (expirationTime < GetTime()) then
					InterruptAuras[self.unitGUID][k] = nil
				else
					if Priority then
						if Priority == maxPriority and expirationTime > maxExpirationTime then
							maxExpirationTime = expirationTime
							Duration = duration
							Icon = icon
							C_Timer.After(expirationTime - GetTime() + 0.05, function()
								self:UNIT_AURA(unitId)
								for e, f in pairs(InterruptAuras) do
									for g, h in ipairs(f) do
										if (h.expirationTime < GetTime()) then
											InterruptAuras[e][g] = nil
										end
									end
								end
							end)
						elseif Priority > maxPriority then
							maxPriority = Priority
							maxExpirationTime = expirationTime
							Duration = duration
							Icon = icon
							C_Timer.After(expirationTime - GetTime() + 0.05, function()
								self:UNIT_AURA(unitId)
								for e, f in pairs(InterruptAuras) do
									for g, h in ipairs(f) do
										if (h.expirationTime < GetTime()) then
											InterruptAuras[e][g] = nil
										end
									end
								end
							end)
						end
					end
				end
			end
		end
	end
	
	if maxExpirationTime == 0 then -- no (de)buffs found
		self.maxExpirationTime = 0
		if self.anchor ~= UIParent and self.drawlayer then
			self.anchor:SetDrawLayer(self.drawlayer) -- restore the original draw layer
		end
		self:Hide()
	elseif maxExpirationTime ~= self.maxExpirationTime then -- this is a different (de)buff, so initialize the cooldown
		self.maxExpirationTime = maxExpirationTime
		if self.anchor ~= UIParent then
			self:SetFrameLevel(self.anchor:GetParent():GetFrameLevel()) -- must be dynamic, frame level changes all the time
			if not self.drawlayer and self.anchor.GetDrawLayer then
				self.drawlayer = self.anchor:GetDrawLayer() -- back up the current draw layer
			end
			if self.drawlayer and self.anchor.SetDrawLayer then
				self.anchor:SetDrawLayer("BACKGROUND") -- Temporarily put the portrait texture below the debuff texture. This is the only reliable method I've found for keeping the debuff texture visible with the cooldown spiral on top of it.
			end
		end
		if self.frame.anchor == "Blizzard" then
			SetPortraitToTexture(self.texture, Icon) -- Sets the texture to be displayed from a file applying a circular opacity mask making it look round like portraits. TO DO: mask the cooldown frame somehow so the corners don't stick out of the portrait frame. Maybe apply a circular alpha mask in the OVERLAY draw layer.
			self:SetSwipeTexture("Interface\\CHARACTERFRAME\\TempPortraitAlphaMaskSmall")
		else
			self.texture:SetTexture(Icon)
		end
		if forceEventUnitAuraAtEnd and maxExpirationTime > 0 then
			C_Timer.After(maxExpirationTime - GetTime() + 0.15, function()
				self:UNIT_AURA(unitId)
			end)
		end
		self:Show()
		if Duration > 0 then
			if not self:GetDrawSwipe() then
				self:SetDrawSwipe(true)
			end
			self:SetCooldown( maxExpirationTime - Duration, Duration )
		else
			if self:GetDrawSwipe() then
				self:SetDrawSwipe(false)
			end
			self:SetCooldown(GetTime(), 0)
			self:SetCooldown(GetTime(), 0)	--needs execute two times (or the icon can dissapear; yes, it's weird...)
		end
		--UIFrameFadeOut(self, Duration, self.frame.alpha, 0)
		self:SetAlpha(self.frame.alpha) -- hack to apply transparency to the cooldown timer
	end
end

function LoseControl:PLAYER_TARGET_CHANGED()
	--if (debug) then print("PLAYER_TARGET_CHANGED") end
	if (self.unitId == "target") then
		self.unitGUID = UnitGUID("target")
	end
	self:UNIT_AURA("target")
end

function LoseControl:UNIT_PET(unitId)
	--if (debug) then print("UNIT_PET", unitId) end
	if (self.unitId == "pet") then
		self.unitGUID = UnitGUID("pet")
	end
	self:UNIT_AURA("pet")
end

-- Handle mouse dragging
function LoseControl:StopMoving()
	local frame = LoseControlDB.frames[self.unitId]
	frame.point, frame.anchor, frame.relativePoint, frame.x, frame.y = self:GetPoint()
	if not frame.anchor then
		frame.anchor = "None"
	end
	self.anchor = _G[anchors[frame.anchor][self.unitId]] or UIParent
	self:StopMovingOrSizing()
end

-- Constructor method
function LoseControl:new(unitId)
	local o = CreateFrame("Cooldown", addonName .. unitId, nil, 'CooldownFrameTemplate') --, UIParent)
	local op = CreateFrame("Frame", addonName .. "FrameParent" .. unitId)
	setmetatable(o, self)
	self.__index = self
	
	o:SetParent(op)
	o.parent = op
	
	o:SetDrawEdge(false)

	-- Init class members
	o.unitId = unitId -- ties the object to a unit
	o.texture = o:CreateTexture(nil, "BORDER") -- displays the debuff; draw layer should equal "BORDER" because cooldown spirals are drawn in the "ARTWORK" layer.
	o.texture:SetAllPoints(o) -- anchor the texture to the frame
	o:SetReverse(true) -- makes the cooldown shade from light to dark instead of dark to light

	o.text = o:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	o.text:SetText(L[unitId])
	o.text:SetPoint("BOTTOM", o, "BOTTOM")
	o.text:Hide()

	-- Rufio's code to make the frame border pretty. Maybe use this somehow to mask cooldown corners in Blizzard frames.
	--o.overlay = o:CreateTexture(nil, "OVERLAY") -- displays the alpha mask for making rounded corners
	--o.overlay:SetTexture("\\MINIMAP\UI-Minimap-Background")
	--o.overlay:SetTexture("Interface\\AddOns\\LoseControl\\gloss")
	--SetPortraitToTexture(o.overlay, "Textures\\MinimapMask")
	--o.overlay:SetBlendMode("BLEND") -- maybe ALPHAKEY or ADD?
	--o.overlay:SetAllPoints(o) -- anchor the texture to the frame
	--o.overlay:SetPoint("TOPLEFT", -1, 1)
	--o.overlay:SetPoint("BOTTOMRIGHT", 1, -1)
	--o.overlay:SetVertexColor(0.25, 0.25, 0.25)
	o:Hide()

	-- Handle events
	o:SetScript("OnEvent", self.OnEvent)
	o:SetScript("OnDragStart", self.StartMoving) -- this function is already built into the Frame class
	o:SetScript("OnDragStop", self.StopMoving) -- this is a custom function

	o:RegisterEvent("PLAYER_ENTERING_WORLD")
	o:RegisterEvent("GROUP_ROSTER_UPDATE")
	o:RegisterEvent("GROUP_JOINED")
	o:RegisterEvent("GROUP_LEFT")

	return o
end

-- Create new object instance for each frame
for k in pairs(DBdefaults.frames) do
	LCframes[k] = LoseControl:new(k)
end

-------------------------------------------------------------------------------
-- Add main Interface Option Panel
local O = addonName .. "OptionsPanel"

local OptionsPanel = CreateFrame("Frame", O)
OptionsPanel.name = addonName

local title = OptionsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetText(addonName)

local subText = OptionsPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
local notes = GetAddOnMetadata(addonName, "Notes-" .. GetLocale())
if not notes then
	notes = GetAddOnMetadata(addonName, "Notes")
end
subText:SetText(notes)

-- "Unlock" checkbox - allow the frames to be moved
local Unlock = CreateFrame("CheckButton", O.."Unlock", OptionsPanel, "OptionsCheckButtonTemplate")
_G[O.."UnlockText"]:SetText(L["Unlock"])
function Unlock:OnClick()
	if self:GetChecked() then
		_G[O.."UnlockText"]:SetText(L["Unlock"] .. L[" (drag an icon to move)"])
		local keys = {} -- for random icon sillyness
		for k in pairs(spellIds) do
			tinsert(keys, k)
		end
		for k, v in pairs(LCframes) do
			local frame = LoseControlDB.frames[k]
			if frame.enabled and (_G[anchors[frame.anchor][k]] or frame.anchor == "None") then -- only unlock frames whose anchor exists
				v:RegisterUnitEvents(false)
				v.texture:SetTexture(select(3, GetSpellInfo(keys[random(#keys)])))
				v.parent:SetParent(nil) -- detach the frame from its parent or else it won't show if the parent is hidden
				--v:SetFrameStrata(frame.strata or "MEDIUM")
				if v.anchor:GetParent() then
					v:SetFrameLevel(v.anchor:GetParent():GetFrameLevel())
				end
				v.text:Show()
				v:Show()
				v:SetDrawSwipe(true)
				v:SetCooldown( GetTime(), 30 )
				v:SetAlpha(frame.alpha) -- hack to apply the alpha to the cooldown timer
				v:SetMovable(true)
				v:RegisterForDrag("LeftButton")
				v:EnableMouse(true)
			end
		end
	else
		_G[O.."UnlockText"]:SetText(L["Unlock"])
		for _, v in pairs(LCframes) do
			v:EnableMouse(false)
			v:RegisterForDrag()
			v:SetMovable(false)
			v.text:Hide()
			v:PLAYER_ENTERING_WORLD()
		end
	end
end
Unlock:SetScript("OnClick", Unlock.OnClick)

local DisableGetEnemiesBuffsInformation = CreateFrame("CheckButton", O.."DisableGetEnemiesBuffsInformation", OptionsPanel, "OptionsCheckButtonTemplate")
_G[O.."DisableGetEnemiesBuffsInformationText"]:SetText(L["Disable Get Enemies Buff Information"])
function DisableGetEnemiesBuffsInformation:Check(value)
	LoseControlDB.noGetEnemiesBuffsInformation = self:GetChecked()
	LoseControl.noGetEnemiesBuffsInformation = LoseControlDB.noGetEnemiesBuffsInformation
	LoseControl:UpdateGetEnemiesBuffInformationOptionState()
end
DisableGetEnemiesBuffsInformation:SetScript("OnClick", function(self)
	DisableGetEnemiesBuffsInformation:Check(self:GetChecked())
end)

local DisableGetExtraDurationInformation = CreateFrame("CheckButton", O.."DisableGetExtraDurationInformation", OptionsPanel, "OptionsCheckButtonTemplate")
_G[O.."DisableGetExtraDurationInformationText"]:SetText(L["Disable Get Extra Aura Duration Information"])
DisableGetExtraDurationInformation:SetScript("OnClick", function(self)
	LoseControlDB.noGetExtraAuraDurationInformation = self:GetChecked()
	LoseControl.noGetExtraAuraDurationInformation = LoseControlDB.noGetExtraAuraDurationInformation
	if self:GetChecked() then
		DisableGetEnemiesBuffsInformation:Disable()
		_G[O.."DisableGetEnemiesBuffsInformationText"]:SetTextColor(0.5,0.5,0.5)
		DisableGetEnemiesBuffsInformation:SetChecked(true)
		DisableGetEnemiesBuffsInformation:Check(true)
	else
		DisableGetEnemiesBuffsInformation:Enable()
		_G[O.."DisableGetEnemiesBuffsInformationText"]:SetTextColor(_G[O.."DisableCooldownCountText"]:GetTextColor())
	end
end)

local DisableBlizzardCooldownCount = CreateFrame("CheckButton", O.."DisableBlizzardCooldownCount", OptionsPanel, "OptionsCheckButtonTemplate")
_G[O.."DisableBlizzardCooldownCountText"]:SetText(L["Disable Blizzard Countdown"])
function DisableBlizzardCooldownCount:Check(value)
	LoseControlDB.noBlizzardCooldownCount = value
	LoseControl.noBlizzardCooldownCount = LoseControlDB.noBlizzardCooldownCount
	LoseControl:SetHideCountdownNumbers(LoseControlDB.noBlizzardCooldownCount)
	for _, v in pairs(LCframes) do
		v:SetHideCountdownNumbers(LoseControlDB.noBlizzardCooldownCount)
	end
end
DisableBlizzardCooldownCount:SetScript("OnClick", function(self)
	DisableBlizzardCooldownCount:Check(self:GetChecked())
end)

local DisableCooldownCount = CreateFrame("CheckButton", O.."DisableCooldownCount", OptionsPanel, "OptionsCheckButtonTemplate")
_G[O.."DisableCooldownCountText"]:SetText(L["Disable OmniCC Support"])
DisableCooldownCount:SetScript("OnClick", function(self)
	LoseControlDB.noCooldownCount = self:GetChecked()
	LoseControl.noCooldownCount = LoseControlDB.noCooldownCount
	if self:GetChecked() then
		DisableBlizzardCooldownCount:Enable()
		_G[O.."DisableBlizzardCooldownCountText"]:SetTextColor(_G[O.."DisableCooldownCountText"]:GetTextColor())
	else
		DisableBlizzardCooldownCount:Disable()
		_G[O.."DisableBlizzardCooldownCountText"]:SetTextColor(0.5,0.5,0.5)
		DisableBlizzardCooldownCount:SetChecked(true)
		DisableBlizzardCooldownCount:Check(true)
	end
end)

local Priority = OptionsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
Priority:SetText(L["Priority"])

local PriorityDescription = OptionsPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
PriorityDescription:SetText(L["PriorityDescription"])

-------------------------------------------------------------------------------
-- Slider helper function, thanks to Kollektiv
local function CreateSlider(text, parent, low, high, step, globalName)
	local name = globalName or (parent:GetName() .. text)
	local slider = CreateFrame("Slider", name, parent, "OptionsSliderTemplate")
	slider:SetWidth(160)
	slider:SetMinMaxValues(low, high)
	slider:SetValueStep(step)
	--_G[name .. "Text"]:SetText(text)
	_G[name .. "Low"]:SetText(low)
	_G[name .. "High"]:SetText(high)
	return slider
end

local PrioritySlider = {}
for k in pairs(DBdefaults.priority) do
	PrioritySlider[k] = CreateSlider(L[k], OptionsPanel, 0, 100, 5)
	PrioritySlider[k]:SetScript("OnValueChanged", function(self, value)
		_G[self:GetName() .. "Text"]:SetText(L[k] .. " (" .. value .. ")")
		LoseControlDB.priority[k] = value
	end)
end

-------------------------------------------------------------------------------
-- Arrange all the options neatly
title:SetPoint("TOPLEFT", 16, -16)
subText:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)

Unlock:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 0, -16)
DisableGetExtraDurationInformation:SetPoint("TOPLEFT", Unlock, "BOTTOMLEFT", 0, -2)
DisableGetEnemiesBuffsInformation:SetPoint("TOPLEFT", DisableGetExtraDurationInformation, "BOTTOMLEFT", 0, -2)
DisableCooldownCount:SetPoint("TOPLEFT", DisableGetEnemiesBuffsInformation, "BOTTOMLEFT", 0, -2)
DisableBlizzardCooldownCount:SetPoint("TOPLEFT", DisableCooldownCount, "BOTTOMLEFT", 0, -2)

Priority:SetPoint("TOPLEFT", DisableBlizzardCooldownCount, "BOTTOMLEFT", 0, -12)
PriorityDescription:SetPoint("TOPLEFT", Priority, "BOTTOMLEFT", 0, -8)
PrioritySlider.PvE:SetPoint("TOPLEFT", PriorityDescription, "BOTTOMLEFT", 0, -24)
PrioritySlider.Immune:SetPoint("TOPLEFT", PrioritySlider.PvE, "BOTTOMLEFT", 0, -24)
PrioritySlider.ImmuneSpell:SetPoint("TOPLEFT", PrioritySlider.Immune, "BOTTOMLEFT", 0, -24)
PrioritySlider.ImmunePhysical:SetPoint("TOPLEFT", PrioritySlider.ImmuneSpell, "BOTTOMLEFT", 0, -24)
PrioritySlider.CC:SetPoint("TOPLEFT", PrioritySlider.ImmunePhysical, "BOTTOMLEFT", 0, -24)
PrioritySlider.Silence:SetPoint("TOPLEFT", PrioritySlider.CC, "BOTTOMLEFT", 0, -24)
PrioritySlider.Interrupt:SetPoint("TOPLEFT", PrioritySlider.Silence, "BOTTOMLEFT", 0, -24)
PrioritySlider.Disarm:SetPoint("TOPLEFT", PrioritySlider.PvE, "TOPRIGHT", 40, 0)
PrioritySlider.Root:SetPoint("TOPLEFT", PrioritySlider.Disarm, "BOTTOMLEFT", 0, -24)
PrioritySlider.Snare:SetPoint("TOPLEFT", PrioritySlider.Root, "BOTTOMLEFT", 0, -24)
PrioritySlider.Other:SetPoint("TOPLEFT", PrioritySlider.Snare, "BOTTOMLEFT", 0, -24)

-------------------------------------------------------------------------------
OptionsPanel.default = function() -- This method will run when the player clicks "defaults".
	_G.LoseControlDB = nil
	LoseControl:ADDON_LOADED(addonName)
	for _, v in pairs(LCframes) do
		v:PLAYER_ENTERING_WORLD()
	end
end

OptionsPanel.refresh = function() -- This method will run when the Interface Options frame calls its OnShow function and after defaults have been applied via the panel.default method described above.
	DisableGetExtraDurationInformation:SetChecked(LoseControlDB.noGetExtraAuraDurationInformation)
	DisableGetEnemiesBuffsInformation:SetChecked(LoseControlDB.noGetEnemiesBuffsInformation)
	DisableCooldownCount:SetChecked(LoseControlDB.noCooldownCount)
	DisableBlizzardCooldownCount:SetChecked(LoseControlDB.noBlizzardCooldownCount)
	if not LoseControlDB.noCooldownCount then
		DisableBlizzardCooldownCount:Disable()
		_G[O.."DisableBlizzardCooldownCountText"]:SetTextColor(0.5,0.5,0.5)
		DisableBlizzardCooldownCount:SetChecked(true)
		DisableBlizzardCooldownCount:Check(true)
	end
	if LoseControlDB.noGetExtraAuraDurationInformation then
		DisableGetEnemiesBuffsInformation:Disable()
		_G[O.."DisableGetEnemiesBuffsInformationText"]:SetTextColor(0.5,0.5,0.5)
		DisableGetEnemiesBuffsInformation:SetChecked(true)
		DisableGetEnemiesBuffsInformation:Check(true)
	end
	local priority = LoseControlDB.priority
	for k in pairs(priority) do
		PrioritySlider[k]:SetValue(priority[k])
	end
end

InterfaceOptions_AddCategory(OptionsPanel)

-------------------------------------------------------------------------------
-- DropDownMenu helper function
local function AddItem(owner, text, value)
	local info = UIDropDownMenu_CreateInfo()
	info.owner = owner
	info.func = owner.OnClick
	info.text = text
	info.value = value
	info.checked = nil -- initially set the menu item to being unchecked
	UIDropDownMenu_AddButton(info)
end

-------------------------------------------------------------------------------
-- Create sub-option frames
for _, v in ipairs({ "player", "pet", "target", "party" }) do
	local OptionsPanelFrame = CreateFrame("Frame", O..v)
	OptionsPanelFrame.parent = addonName
	OptionsPanelFrame.name = L[v]

	local AnchorDropDownLabel = OptionsPanelFrame:CreateFontString(O..v.."AnchorDropDownLabel", "ARTWORK", "GameFontNormal")
	AnchorDropDownLabel:SetText(L["Anchor"])
	local AnchorDropDown = CreateFrame("Frame", O..v.."AnchorDropDown", OptionsPanelFrame, "UIDropDownMenuTemplate")
	function AnchorDropDown:OnClick()
		UIDropDownMenu_SetSelectedValue(AnchorDropDown, self.value)
		local frames = { v }
		if v == "party" then
			frames = { "party1", "party2", "party3", "party4" }
		end
		for _, unitId in ipairs(frames) do
			local frame = LoseControlDB.frames[unitId]
			local icon = LCframes[unitId]
			frame.anchor = self.value
			if self.value ~= "None" then -- reset the frame position so it centers on the anchor frame
				frame.point = nil
				frame.relativePoint = nil
				frame.x = nil
				frame.y = nil
				if self.value == "Blizzard" then
					local portrSizeValue = 36
					if (unitId == "player" or unitId == "target") then
						portrSizeValue = 56
					end
					frame.size = portrSizeValue
					LCframes[unitId]:SetWidth(portrSizeValue)
					LCframes[unitId]:SetHeight(portrSizeValue)
					_G[OptionsPanelFrame:GetName() .. "IconSizeSlider"]:SetValue(portrSizeValue)
				end
			end

			icon.anchor = _G[anchors[frame.anchor][unitId]] or UIParent

			if not Unlock:GetChecked() then -- prevents the icon from disappearing if the frame is currently hidden
				icon.parent:SetParent(icon.anchor:GetParent())
			end

			icon:ClearAllPoints() -- if we don't do this then the frame won't always move
			icon:SetPoint(
				frame.point or "CENTER",
				icon.anchor,
				frame.relativePoint or "CENTER",
				frame.x or 0,
				frame.y or 0
			)
		end
	end

	local SizeSlider = CreateSlider(L["Icon Size"], OptionsPanelFrame, 16, 512, 4, OptionsPanelFrame:GetName() .. "IconSizeSlider")
	SizeSlider:SetScript("OnValueChanged", function(self, value)
		_G[self:GetName() .. "Text"]:SetText(L["Icon Size"] .. " (" .. value .. "px)")
		local frames = { v }
		if v == "party" then
			frames = { "party1", "party2", "party3", "party4" }
		end
		for _, frame in ipairs(frames) do
			LoseControlDB.frames[frame].size = value
			LCframes[frame]:SetWidth(value)
			LCframes[frame]:SetHeight(value)
		end
	end)

	local AlphaSlider = CreateSlider(L["Opacity"], OptionsPanelFrame, 0, 100, 5) -- I was going to use a range of 0 to 1 but Blizzard's slider chokes on decimal values
	AlphaSlider:SetScript("OnValueChanged", function(self, value)
		_G[self:GetName() .. "Text"]:SetText(L["Opacity"] .. " (" .. value .. "%)")
		local frames = { v }
		if v == "party" then
			frames = { "party1", "party2", "party3", "party4" }
		end
		for _, frame in ipairs(frames) do
			LoseControlDB.frames[frame].alpha = value / 100 -- the real alpha value
			LCframes[frame]:SetAlpha(value / 100)
		end
	end)

	local DisableInBG
	if v == "party" then
		DisableInBG = CreateFrame("CheckButton", O..v.."DisableInBG", OptionsPanelFrame, "OptionsCheckButtonTemplate")
		_G[O..v.."DisableInBGText"]:SetText(L["DisableInBG"])
		DisableInBG:SetScript("OnClick", function(self)
			LoseControlDB.disablePartyInBG = self:GetChecked()
			if not Unlock:GetChecked() then -- prevents the icon from disappearing if the frame is currently hidden
				for i = 1, 4 do
					LCframes[v .. i]:PLAYER_ENTERING_WORLD()
				end
			end
		end)
	end

	local DisableInRaid
	if v == "party" then
		DisableInRaid = CreateFrame("CheckButton", O..v.."DisableInRaid", OptionsPanelFrame, "OptionsCheckButtonTemplate")
		_G[O..v.."DisableInRaidText"]:SetText(L["DisableInRaid"])
		DisableInRaid:SetScript("OnClick", function(self)
			LoseControlDB.disablePartyInRaid = self:GetChecked()
			if not Unlock:GetChecked() then -- prevents the icon from disappearing if the frame is currently hidden
				for i = 1, 4 do
					LCframes[v .. i]:PLAYER_ENTERING_WORLD()
				end
			end
		end)
	end

	local DisableInterrupts
	if v == "player" then
		DisableInterrupts = CreateFrame("CheckButton", O..v.."DisableInterrupts", OptionsPanelFrame, "OptionsCheckButtonTemplate")
		_G[O..v.."DisableInterruptsText"]:SetText(L["DisableInterrupts"])
		DisableInterrupts:SetScript("OnClick", function(self)
			LoseControlDB.disablePlayerInterrupts = self:GetChecked()
			if not Unlock:GetChecked() then -- prevents the icon from disappearing if the frame is currently hidden
				LCframes[v]:PLAYER_ENTERING_WORLD()
			end
		end)
	end

	local Enabled = CreateFrame("CheckButton", O..v.."Enabled", OptionsPanelFrame, "OptionsCheckButtonTemplate")
	_G[O..v.."EnabledText"]:SetText(L["Enabled"])
	Enabled:SetScript("OnClick", function(self)
		local enabled = self:GetChecked()
		if enabled then
			if DisableInBG then BlizzardOptionsPanel_CheckButton_Enable(DisableInBG) end
			if DisableInRaid then BlizzardOptionsPanel_CheckButton_Enable(DisableInRaid) end
			if DisableInterrupts then BlizzardOptionsPanel_CheckButton_Enable(DisableInterrupts) end
			BlizzardOptionsPanel_Slider_Enable(SizeSlider)
			BlizzardOptionsPanel_Slider_Enable(AlphaSlider)
		else
			if DisableInBG then BlizzardOptionsPanel_CheckButton_Disable(DisableInBG) end
			if DisableInRaid then BlizzardOptionsPanel_CheckButton_Disable(DisableInRaid) end
			if DisableInterrupts then BlizzardOptionsPanel_CheckButton_Disable(DisableInterrupts) end
			BlizzardOptionsPanel_Slider_Disable(SizeSlider)
			BlizzardOptionsPanel_Slider_Disable(AlphaSlider)
		end
		local frames = { v }
		if v == "party" then
			frames = { "party1", "party2", "party3", "party4" }
		end
		for _, frame in ipairs(frames) do
			LoseControlDB.frames[frame].enabled = enabled
			local inInstance, instanceType = IsInInstance()
			local enable = enabled and not (
				inInstance and instanceType == "pvp" and (
					( LoseControlDB.disablePartyInBG and string.find(frame, "party") )
				)
			) and not (
				IsInRaid() and LoseControlDB.disablePartyInRaid and string.find(frame, "party")
			)
			LCframes[frame]:RegisterUnitEvents(enable)
		end
	end)

	Enabled:SetPoint("TOPLEFT", 16, -32)
	if DisableInBG then DisableInBG:SetPoint("TOPLEFT", Enabled, 200, 0) end
	if DisableInRaid then DisableInRaid:SetPoint("TOPLEFT", Enabled, 200, -25) end
	if DisableInterrupts then DisableInterrupts:SetPoint("TOPLEFT", Enabled, 200, 0) end
	SizeSlider:SetPoint("TOPLEFT", Enabled, "BOTTOMLEFT", 0, -32)
	AlphaSlider:SetPoint("TOPLEFT", SizeSlider, "BOTTOMLEFT", 0, -32)
	AnchorDropDownLabel:SetPoint("TOPLEFT", AlphaSlider, "BOTTOMLEFT", 0, -12)
	AnchorDropDown:SetPoint("TOPLEFT", AnchorDropDownLabel, "BOTTOMLEFT", 0, -8)

	OptionsPanelFrame.default = OptionsPanel.default
	OptionsPanelFrame.refresh = function()
		local unitId = v
		if unitId == "party" then
			DisableInBG:SetChecked(LoseControlDB.disablePartyInBG)
			DisableInRaid:SetChecked(LoseControlDB.disablePartyInRaid)
			unitId = "party1"
		elseif unitId == "player" then
			DisableInterrupts:SetChecked(LoseControlDB.disablePlayerInterrupts)
		end
		local frame = LoseControlDB.frames[unitId]
		Enabled:SetChecked(frame.enabled)
		if frame.enabled then
			if DisableInBG then BlizzardOptionsPanel_CheckButton_Enable(DisableInBG) end
			if DisableInRaid then BlizzardOptionsPanel_CheckButton_Enable(DisableInRaid) end
			if DisableInterrupts then BlizzardOptionsPanel_CheckButton_Enable(DisableInterrupts) end
			BlizzardOptionsPanel_Slider_Enable(SizeSlider)
			BlizzardOptionsPanel_Slider_Enable(AlphaSlider)
		else
			if DisableInBG then BlizzardOptionsPanel_CheckButton_Disable(DisableInBG) end
			if DisableInRaid then BlizzardOptionsPanel_CheckButton_Disable(DisableInRaid) end
			if DisableInterrupts then BlizzardOptionsPanel_CheckButton_Disable(DisableInterrupts) end
			BlizzardOptionsPanel_Slider_Disable(SizeSlider)
			BlizzardOptionsPanel_Slider_Disable(AlphaSlider)
		end
		SizeSlider:SetValue(frame.size)
		AlphaSlider:SetValue(frame.alpha * 100)
		UIDropDownMenu_Initialize(AnchorDropDown, function() -- called on refresh and also every time the drop down menu is opened
			AddItem(AnchorDropDown, L["None"], "None")
			AddItem(AnchorDropDown, "Blizzard", "Blizzard")
			if _G[anchors["Perl"][unitId]] then AddItem(AnchorDropDown, "Perl", "Perl") end
			if _G[anchors["XPerl"][unitId]] then AddItem(AnchorDropDown, "XPerl", "XPerl") end
			if _G[anchors["LUI"][unitId]] then AddItem(AnchorDropDown, "LUI", "LUI") end
		end)
		UIDropDownMenu_SetSelectedValue(AnchorDropDown, frame.anchor)
	end

	InterfaceOptions_AddCategory(OptionsPanelFrame)
end

-------------------------------------------------------------------------------
SLASH_LoseControl1 = "/lc"
SLASH_LoseControl2 = "/losecontrol"

local SlashCmd = {}
function SlashCmd:help()
	print(addonName, "slash commands:")
	print("    reset [<unit>]")
	print("    lock")
	print("    unlock")
	print("    enable <unit>")
	print("    disable <unit>")
	print("<unit> can be: player, pet, target, party1 ... party4")
end
function SlashCmd:debug(value)
	if value == "on" then
		debug = true
		print(addonName, "debugging enabled.")
	elseif value == "off" then
		debug = false
		print(addonName, "debugging disabled.")
	end
end
function SlashCmd:reset(unitId)
	if LoseControlDB.frames[unitId] then
		LoseControlDB.frames[unitId] = CopyTable(DBdefaults.frames[unitId])
		LCframes[unitId]:PLAYER_ENTERING_WORLD()
	else
		OptionsPanel.default()
	end
	Unlock:OnClick()
	OptionsPanel.refresh()
end
function SlashCmd:lock()
	Unlock:SetChecked(false)
	Unlock:OnClick()
	print(addonName, "locked.")
end
function SlashCmd:unlock()
	Unlock:SetChecked(true)
	Unlock:OnClick()
	print(addonName, "unlocked.")
end
function SlashCmd:enable(unitId)
	if LCframes[unitId] then
		LoseControlDB.frames[unitId].enabled = true
		local inInstance, instanceType = IsInInstance()
		local enabled = not (
			inInstance and instanceType == "pvp" and (
				( LoseControlDB.disablePartyInBG and string.find(unitId, "party") )
			)
		) and not (
			IsInRaid() and LoseControlDB.disablePartyInRaid and string.find(unitId, "party")
		)
		LCframes[unitId]:RegisterUnitEvents(enabled)
		print(addonName, unitId, "frame enabled.")
	end
end
function SlashCmd:disable(unitId)
	if LCframes[unitId] then
		LoseControlDB.frames[unitId].enabled = false
		LCframes[unitId]:RegisterUnitEvents(false)
		print(addonName, unitId, "frame disabled.")
	end
end

SlashCmdList[addonName] = function(cmd)
	local args = {}
	for word in cmd:lower():gmatch("%S+") do
		tinsert(args, word)
	end
	if SlashCmd[args[1]] then
		SlashCmd[args[1]](unpack(args))
	else
		print(addonName, ": Type \"/lc help\" for more options.")
		InterfaceOptionsFrame_OpenToCategory(OptionsPanel)
		InterfaceOptionsFrame_OpenToCategory(OptionsPanel)
	end
end
