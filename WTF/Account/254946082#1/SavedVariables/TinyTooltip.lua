
BigTipDB = {
	["spell"] = {
		["background"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
			1, -- [4]
		},
		["showIcon"] = false,
		["borderColor"] = {
			0.6, -- [1]
			0.6, -- [2]
			0.6, -- [3]
			0.8, -- [4]
		},
	},
	["general"] = {
		["SavedVariablesPerCharacter"] = false,
		["statusbarFontSize"] = 10,
		["scale"] = "1.0",
		["mask"] = false,
		["bgfile"] = "Blizzard Tooltip",
		["headerFont"] = "default",
		["borderSize"] = 1,
		["borderColor"] = {
			0.63921568627451, -- [1]
			0.63921568627451, -- [2]
			0.63921568627451, -- [3]
			0.63, -- [4]
		},
		["anchor"] = {
			["p"] = "BOTTOMRIGHT",
			["hiddenInCombat"] = false,
			["returnInCombat"] = true,
			["returnOnUnitFrame"] = true,
			["cy"] = -25,
			["cx"] = 25,
			["cp"] = "TOPLEFT",
			["position"] = "cursor",
		},
		["background"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
			0.9, -- [4]
		},
		["statusbarPosition"] = "bottom",
		["statusbarOffsetX"] = 0,
		["skinMoreFrames"] = false,
		["bodyFontSize"] = "default",
		["bodyFontFlag"] = "default",
		["bodyFont"] = "default",
		["statusbarOffsetY"] = 0,
		["statusbarTexture"] = "Blizzard Raid Bar",
		["headerFontSize"] = 13,
		["statusbarText"] = false,
		["statusbarHeight"] = 1,
		["headerFontFlag"] = "default",
		["borderCorner"] = "default",
		["statusbarColor"] = "default",
		["statusbarFontFlag"] = "THINOUTLINE",
		["alwaysShowIdInfo"] = false,
	},
	["version"] = 2.6,
	["variables"] = {
	},
	["item"] = {
		["coloredItemBorder"] = false,
		["showItemIcon"] = false,
	},
	["quest"] = {
		["coloredQuestBorder"] = false,
	},
	["unit"] = {
		["player"] = {
			["elements"] = {
				{
					"raidIcon", -- [1]
					"roleIcon", -- [2]
					"pvpIcon", -- [3]
					"factionIcon", -- [4]
					"classIcon", -- [5]
					"title", -- [6]
					"name", -- [7]
					"realm", -- [8]
					"statusAFK", -- [9]
					"statusDND", -- [10]
					"statusDC", -- [11]
				}, -- [1]
				{
					"guildName", -- [1]
					"guildIndex", -- [2]
					"guildRank", -- [3]
					"guildRealm", -- [4]
				}, -- [2]
				{
					"levelValue", -- [1]
					"factionName", -- [2]
					"gender", -- [3]
					"raceName", -- [4]
					"className", -- [5]
					"isPlayer", -- [6]
					"role", -- [7]
					"moveSpeed", -- [8]
				}, -- [3]
				{
					"zone", -- [1]
				}, -- [4]
				["guildRank"] = {
					["enable"] = false,
					["color"] = "default",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["statusAFK"] = {
					["enable"] = true,
					["color"] = "default",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["guildIndex"] = {
					["enable"] = false,
					["color"] = "default",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["zone"] = {
					["enable"] = false,
					["color"] = "default",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["statusDC"] = {
					["enable"] = true,
					["color"] = "default",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["raceName"] = {
					["enable"] = true,
					["color"] = "itemQuality",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["role"] = {
					["enable"] = false,
					["color"] = "default",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["factionName"] = {
					["enable"] = false,
					["color"] = "default",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["raidIcon"] = {
					["enable"] = true,
					["filter"] = "none",
				},
				["levelValue"] = {
					["enable"] = true,
					["color"] = "f1f1f1",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["realm"] = {
					["enable"] = false,
					["color"] = "default",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["roleIcon"] = {
					["enable"] = false,
					["filter"] = "none",
				},
				["pvpIcon"] = {
					["enable"] = false,
					["filter"] = "none",
				},
				["moveSpeed"] = {
					["enable"] = false,
					["color"] = "default",
					["wildcard"] = "%d%%",
					["filter"] = "none",
				},
				["gender"] = {
					["enable"] = false,
					["color"] = "default",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["guildRealm"] = {
					["enable"] = false,
					["color"] = "default",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["statusDND"] = {
					["enable"] = true,
					["color"] = "default",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["isPlayer"] = {
					["enable"] = false,
					["color"] = "default",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["guildName"] = {
					["enable"] = true,
					["color"] = "itemQuality",
					["wildcard"] = "<%s>",
					["filter"] = "none",
				},
				["factionBig"] = {
					["enable"] = false,
					["filter"] = "none",
				},
				["className"] = {
					["enable"] = true,
					["color"] = "class",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["name"] = {
					["enable"] = true,
					["color"] = "default",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["title"] = {
					["enable"] = true,
					["color"] = "default",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["factionIcon"] = {
					["enable"] = false,
					["filter"] = "none",
				},
				["classIcon"] = {
					["enable"] = false,
					["filter"] = "none",
				},
			},
			["showModel"] = false,
			["showTargetBy"] = false,
			["coloredBorder"] = "default",
			["showTarget"] = true,
			["background"] = {
				["colorfunc"] = "default",
				["alpha"] = "0.00",
			},
			["anchor"] = {
				["returnOnUnitFrame"] = false,
				["position"] = "inherit",
				["hiddenInCombat"] = false,
				["cp"] = "BOTTOM",
				["p"] = "BOTTOMRIGHT",
				["returnInCombat"] = false,
			},
			["grayForDead"] = true,
		},
		["npc"] = {
			["elements"] = {
				{
					"raidIcon", -- [1]
					"classIcon", -- [2]
					"questIcon", -- [3]
					"name", -- [4]
				}, -- [1]
				{
					"levelValue", -- [1]
					"classifBoss", -- [2]
					"classifElite", -- [3]
					"classifRare", -- [4]
					"creature", -- [5]
					"reactionName", -- [6]
					"moveSpeed", -- [7]
				}, -- [2]
				["creature"] = {
					["enable"] = true,
					["color"] = "itemQuality",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["classifElite"] = {
					["enable"] = true,
					["color"] = "default",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["npcTitle"] = {
					["enable"] = true,
					["color"] = "default",
					["wildcard"] = "<%s>",
					["filter"] = "none",
				},
				["questIcon"] = {
					["enable"] = true,
					["filter"] = "none",
				},
				["classifBoss"] = {
					["enable"] = true,
					["color"] = "default",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["moveSpeed"] = {
					["enable"] = false,
					["color"] = "default",
					["wildcard"] = "%d%%",
					["filter"] = "none",
				},
				["reactionName"] = {
					["enable"] = false,
					["color"] = "default",
					["wildcard"] = "<%s>",
					["filter"] = "reaction6",
				},
				["factionBig"] = {
					["enable"] = false,
					["filter"] = "none",
				},
				["name"] = {
					["enable"] = true,
					["color"] = "default",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["classifRare"] = {
					["enable"] = true,
					["color"] = "default",
					["wildcard"] = "(%s)",
					["filter"] = "none",
				},
				["raidIcon"] = {
					["enable"] = false,
					["filter"] = "none",
				},
				["levelValue"] = {
					["enable"] = true,
					["color"] = "default",
					["wildcard"] = "%s",
					["filter"] = "none",
				},
				["classIcon"] = {
					["enable"] = false,
					["filter"] = "none",
				},
			},
			["coloredBorder"] = "default",
			["anchor"] = {
				["returnOnUnitFrame"] = false,
				["position"] = "inherit",
				["hiddenInCombat"] = false,
				["cp"] = "BOTTOM",
				["p"] = "BOTTOMRIGHT",
				["returnInCombat"] = false,
			},
			["showTarget"] = false,
			["background"] = {
				["colorfunc"] = "default",
				["alpha"] = 0.9,
			},
			["showTargetBy"] = false,
			["grayForDead"] = true,
		},
	},
}
