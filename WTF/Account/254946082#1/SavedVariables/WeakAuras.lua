
WeakAurasSaved = {
	["dynamicIconCache"] = {
	},
	["displays"] = {
		["snd"] = {
			["glow"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = -179.000717163086,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["auranames"] = {
							"Slice and Dice", -- [1]
						},
						["useName"] = true,
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 23,
			["glowXOffset"] = 0,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "slidebottom",
					["type"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["type"] = "none",
				},
			},
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["rotateText"] = "NONE",
					["text_fontSize"] = 15,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [1]
			},
			["height"] = 35,
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["frameStrata"] = 1,
			["glowFrequency"] = 0.25,
			["width"] = 35,
			["progressPrecision"] = 0,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 1,
			["anchorFrameType"] = "SCREEN",
			["keepAspectRatio"] = false,
			["glowLines"] = 8,
			["regionType"] = "icon",
			["xOffset"] = -179.499908447266,
			["useglowColor"] = false,
			["config"] = {
			},
			["glowLength"] = 10,
			["authorOptions"] = {
			},
			["useGlowColor"] = false,
			["cooldownTextDisabled"] = true,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "snd",
			["zoom"] = 0,
			["alpha"] = 1,
			["glowYOffset"] = 0,
			["selfPoint"] = "CENTER",
			["uid"] = "b(uEBd00LZ1",
			["inverse"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
					["do_glow"] = false,
				},
			},
			["conditions"] = {
			},
			["cooldown"] = true,
			["glowBorder"] = false,
		},
		["CC"] = {
			["glow"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = -148.000534057617,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["ownOnly"] = true,
						["event"] = "Health",
						["names"] = {
						},
						["spellIds"] = {
						},
						["auranames"] = {
							"Gouge", -- [1]
							"Cheap Shot", -- [2]
							"Kidney Shot", -- [3]
							"Blind", -- [4]
							"Sap", -- [5]
						},
						["unit"] = "target",
						["subeventPrefix"] = "SPELL",
						["useName"] = true,
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 23,
			["glowXOffset"] = 0,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["preset"] = "slidetop",
					["type"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["preset"] = "shrink",
					["type"] = "none",
				},
			},
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_visible"] = true,
					["rotateText"] = "NONE",
					["anchorXOffset"] = 0,
					["text_fontSize"] = 15,
				}, -- [1]
			},
			["height"] = 45,
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["glowFrequency"] = 0.25,
			["glowLines"] = 8,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 1,
			["config"] = {
			},
			["glowLength"] = 10,
			["useglowColor"] = false,
			["regionType"] = "icon",
			["keepAspectRatio"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
					["do_glow"] = false,
					["do_sound"] = false,
				},
			},
			["selfPoint"] = "CENTER",
			["authorOptions"] = {
			},
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["zoom"] = 0,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "CC",
			["cooldownTextDisabled"] = true,
			["alpha"] = 1,
			["width"] = 45,
			["glowYOffset"] = 0,
			["uid"] = "yy2ziQbRS(n",
			["inverse"] = false,
			["xOffset"] = 0.5,
			["conditions"] = {
			},
			["cooldown"] = true,
			["glowBorder"] = false,
		},
		["energy tick"] = {
			["sparkWidth"] = 13,
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = 0,
			["yOffset"] = -180,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["duration"] = "1",
						["names"] = {
						},
						["powertype"] = 3,
						["use_powertype"] = true,
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["unit"] = "player",
						["custom_type"] = "stateupdate",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["use_percentpower"] = false,
						["unevent"] = "auto",
						["spellIds"] = {
						},
						["events"] = "UNIT_POWER_FREQUENT:player ENERGYTICK",
						["custom"] = "function(a, e, t)\n    local currEnergy = UnitPower(\"player\", 3)\n    local dur = 2\n    if (e == \"UNIT_POWER_FREQUENT\" and currEnergy > (aura_env.lastEnergy or 0))\n    or (e == \"ENERGYTICK\" and t and currEnergy == UnitPowerMax(\"player\", 3))\n    then\n        if not a[\"\"]  then\n            a[\"\"] = {\n                show = true,\n                changed = true,\n                duration = dur,\n                expirationTime = GetTime() + dur,\n                progressType = \"timed\"\n            }\n        else\n            local s = a[\"\"]\n            s.changed = true\n            s.duration = dur\n            s.expirationTime = GetTime() + dur\n            s.show = true\n            C_Timer.After(2, function() WeakAuras.ScanEvents(\"ENERGYTICK\", true) end)\n        end\n    end\n    aura_env.lastEnergy = currEnergy\n    return true\nend",
						["check"] = "event",
						["use_unit"] = true,
						["buffShowOn"] = "showOnActive",
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 23,
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["use_scale"] = true,
					["colorB"] = 1,
					["colorG"] = 1,
					["use_translate"] = false,
					["use_alpha"] = false,
					["type"] = "none",
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["scaley"] = 0.6,
					["alpha"] = 0,
					["scaleType"] = "straightScale",
					["y"] = 0,
					["x"] = 0,
					["colorA"] = 1,
					["scalex"] = 0.5,
					["preset"] = "shrink",
					["rotate"] = 0,
					["duration_type"] = "seconds",
					["duration"] = "0.1",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 0,
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "preset",
					["scaleType"] = "straightScale",
					["preset"] = "fade",
					["alpha"] = 0,
					["colorB"] = 1,
					["y"] = 0,
					["x"] = 0,
					["duration_type"] = "seconds",
					["use_scale"] = true,
					["duration"] = "0.1",
					["rotate"] = 0,
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["scaley"] = 1,
				},
			},
			["backdropInFront"] = false,
			["auto"] = true,
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["desaturate"] = false,
			["parent"] = "Energy Bar + Tick",
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
				{
					["type"] = "subborder",
					["border_anchor"] = "bar",
					["border_offset"] = 5,
					["border_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						0.5, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "None",
					["border_size"] = 16,
				}, -- [2]
			},
			["height"] = 17,
			["icon"] = false,
			["load"] = {
				["use_class"] = true,
				["use_combat"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "ROGUE",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["useAdjustededMax"] = false,
			["sparkOffsetX"] = 0,
			["authorOptions"] = {
			},
			["selfPoint"] = "CENTER",
			["config"] = {
			},
			["zoom"] = 0,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["borderInFront"] = true,
			["width"] = 127,
			["icon_side"] = "RIGHT",
			["frameStrata"] = 1,
			["sparkHeight"] = 25,
			["texture"] = "Blizzard",
			["sparkHidden"] = "NEVER",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["spark"] = true,
			["tocversion"] = 11302,
			["id"] = "energy tick",
			["sparkDesaturate"] = true,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["uid"] = "Xpswt5uiwYS",
			["inverse"] = true,
			["sparkMirror"] = false,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["stickyDuration"] = false,
		},
		["Energy Bar + Tick"] = {
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["controlledChildren"] = {
				"Energy", -- [1]
				"energy tick", -- [2]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["scale"] = 1,
			["regionType"] = "group",
			["border"] = false,
			["yOffset"] = -45.1674499511719,
			["anchorPoint"] = "CENTER",
			["borderSize"] = 2,
			["internalVersion"] = 23,
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["authorOptions"] = {
			},
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["borderEdge"] = "1 Pixel",
			["borderOffset"] = 4,
			["tocversion"] = 11302,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["id"] = "Energy Bar + Tick",
			["uid"] = "bJ4ejxY68aj",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["borderInset"] = 1,
			["config"] = {
			},
			["selfPoint"] = "BOTTOMLEFT",
			["subRegions"] = {
			},
			["conditions"] = {
			},
			["load"] = {
				["use_class"] = "true",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "ROGUE",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["xOffset"] = 0,
		},
		["Energy"] = {
			["sparkWidth"] = 10,
			["borderBackdrop"] = "Blizzard Tooltip",
			["parent"] = "Energy Bar + Tick",
			["yOffset"] = -180,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.750000759959221, -- [4]
			},
			["triggers"] = {
				{
					["trigger"] = {
						["duration"] = "1",
						["use_showCost"] = true,
						["subeventPrefix"] = "SPELL",
						["powertype"] = 3,
						["use_powertype"] = true,
						["debuffType"] = "HELPFUL",
						["type"] = "status",
						["custom_hide"] = "timed",
						["subeventSuffix"] = "_CAST_START",
						["custom_type"] = "stateupdate",
						["use_unit"] = true,
						["event"] = "Power",
						["use_percentpower"] = false,
						["unevent"] = "auto",
						["use_power"] = false,
						["spellIds"] = {
						},
						["unit"] = "player",
						["names"] = {
						},
						["buffShowOn"] = "showOnActive",
						["percentpower"] = "100",
						["percentpower_operator"] = "<",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 23,
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["use_scale"] = true,
					["colorB"] = 1,
					["colorG"] = 1,
					["use_translate"] = false,
					["use_alpha"] = false,
					["type"] = "none",
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["scaley"] = 0.6,
					["alpha"] = 0,
					["scaleType"] = "straightScale",
					["y"] = 0,
					["x"] = 0,
					["colorA"] = 1,
					["scalex"] = 0.5,
					["preset"] = "shrink",
					["rotate"] = 0,
					["duration_type"] = "seconds",
					["duration"] = "0.1",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["colorR"] = 1,
					["use_scale"] = true,
					["colorB"] = 1,
					["colorG"] = 1,
					["type"] = "preset",
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["preset"] = "fade",
					["alpha"] = 0,
					["scaleType"] = "straightScale",
					["y"] = 0,
					["x"] = 0,
					["colorA"] = 1,
					["duration"] = "0.1",
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["scaley"] = 1,
					["scalex"] = 0,
				},
			},
			["backdropInFront"] = false,
			["text"] = false,
			["barColor"] = {
				1, -- [1]
				0.909803921568627, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["stickyDuration"] = false,
			["width"] = 127,
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
				{
					["text_shadowXOffset"] = 1,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = -1,
					["text_selfPoint"] = "AUTO",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_CENTER",
					["anchorYOffset"] = 0,
					["text_fontSize"] = 10,
					["rotateText"] = "NONE",
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [2]
				{
					["border_size"] = 14,
					["type"] = "subborder",
					["border_anchor"] = "bar",
					["text_color"] = {
					},
					["border_color"] = {
						0.858823529411765, -- [1]
						0.858823529411765, -- [2]
						0.858823529411765, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Blizzard Tooltip",
					["border_offset"] = 3,
				}, -- [3]
			},
			["height"] = 15,
			["sparkOffsetX"] = 0,
			["load"] = {
				["use_class"] = true,
				["use_combat"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "ROGUE",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["authorOptions"] = {
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["desaturate"] = false,
			["uid"] = "BEIGdMCH8gm",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["smoothProgress"] = true,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["borderInFront"] = true,
			["config"] = {
			},
			["icon_side"] = "RIGHT",
			["spark"] = false,
			["sparkHeight"] = 30,
			["texture"] = "Blizzard",
			["frameStrata"] = 1,
			["zoom"] = 0,
			["auto"] = true,
			["tocversion"] = 11302,
			["sparkHidden"] = "NEVER",
			["icon"] = false,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["id"] = "Energy",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["xOffset"] = 0,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["selfPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
		},
		["Riposte"] = {
			["glow"] = true,
			["authorOptions"] = {
			},
			["yOffset"] = -190.500595092773,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["useglowColor"] = false,
			["internalVersion"] = 23,
			["glowXOffset"] = 0,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["version"] = 1,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%s",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["anchorYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["rotateText"] = "NONE",
				}, -- [1]
			},
			["height"] = 35,
			["glowLines"] = 8,
			["glowFrequency"] = 0.25,
			["width"] = 35,
			["zoom"] = 0,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 1,
			["keepAspectRatio"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["duration"] = "1",
						["use_unit"] = true,
						["debuffType"] = "HELPFUL",
						["type"] = "status",
						["unevent"] = "auto",
						["use_spellCount"] = false,
						["unit"] = "player",
						["event"] = "Action Usable",
						["spellName"] = 14251,
						["realSpellName"] = "Riposte",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["use_targetRequired"] = false,
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["buffShowOn"] = "showOnActive",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "status",
						["unevent"] = "auto",
						["use_genericShowOn"] = true,
						["duration"] = "1",
						["genericShowOn"] = "showAlways",
						["unit"] = "player",
						["realSpellName"] = "Riposte",
						["use_spellName"] = true,
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["event"] = "Cooldown Progress (Spell)",
						["use_unit"] = true,
						["use_track"] = true,
						["spellName"] = 14251,
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [2]
				["activeTriggerMode"] = -10,
			},
			["load"] = {
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["regionType"] = "icon",
			["icon"] = true,
			["glowLength"] = 10,
			["url"] = "https://wago.io/bpPhvVO7Y/1",
			["config"] = {
			},
			["alpha"] = 1,
			["tocversion"] = 11302,
			["cooldownTextDisabled"] = false,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "Riposte",
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["frameStrata"] = 1,
			["glowYOffset"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["uid"] = "VoWoe3Nrqn1",
			["inverse"] = false,
			["xOffset"] = 6.1035156250e-05,
			["conditions"] = {
			},
			["anchorFrameType"] = "SCREEN",
			["glowBorder"] = false,
		},
	},
	["minimap"] = {
		["minimapPos"] = 6.34019174590991,
		["hide"] = true,
	},
	["history"] = {
		["ovA8fq5aYGc"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1567329593,
			["allowUpdates"] = true,
			["data"] = {
				["sparkWidth"] = 10,
				["borderBackdrop"] = "Blizzard Tooltip",
				["authorOptions"] = {
				},
				["yOffset"] = -169.333190917969,
				["anchorPoint"] = "CENTER",
				["sparkRotation"] = 0,
				["sparkRotationMode"] = "AUTO",
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["use_unit"] = true,
							["duration"] = "1",
							["event"] = "Power",
							["names"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["powertype"] = 3,
							["spellIds"] = {
							},
							["use_showCost"] = true,
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["use_powertype"] = true,
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					["activeTriggerMode"] = -10,
				},
				["icon_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["internalVersion"] = 23,
				["selfPoint"] = "CENTER",
				["backdropInFront"] = false,
				["text"] = false,
				["barColor"] = {
					1, -- [1]
					0.909803921568627, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["stickyDuration"] = false,
				["sparkOffsetY"] = 0,
				["subRegions"] = {
					{
						["type"] = "aurabar_bar",
					}, -- [1]
					{
						["text_shadowXOffset"] = 1,
						["type"] = "subtext",
						["text_text"] = "%p",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = -1,
						["text_selfPoint"] = "AUTO",
						["text_fontType"] = "None",
						["text_anchorPoint"] = "INNER_CENTER",
						["anchorYOffset"] = 0,
						["text_visible"] = true,
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
					}, -- [2]
					{
						["text_shadowXOffset"] = 1,
						["type"] = "subtext",
						["text_text"] = "%n",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = -1,
						["text_selfPoint"] = "AUTO",
						["text_fontType"] = "None",
						["text_anchorPoint"] = "INNER_RIGHT",
						["anchorYOffset"] = 0,
						["text_visible"] = false,
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
					}, -- [3]
					{
						["border_size"] = 16,
						["border_anchor"] = "bar",
						["type"] = "subborder",
						["border_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							0.5, -- [4]
						},
						["border_visible"] = false,
						["border_edge"] = "None",
						["border_offset"] = 5,
					}, -- [4]
				},
				["height"] = 21.9999904632568,
				["desaturate"] = false,
				["load"] = {
					["use_class"] = true,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "ROGUE",
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["sparkBlendMode"] = "ADD",
				["useAdjustededMax"] = false,
				["animation"] = {
					["start"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
				},
				["backdropColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					0.5, -- [4]
				},
				["xOffset"] = 6.33369445800781,
				["parent"] = "Energy Bar + Tick 2",
				["uid"] = "BEIGdMCH8gm",
				["smoothProgress"] = true,
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["borderInFront"] = true,
				["sparkColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["icon_side"] = "RIGHT",
				["auto"] = true,
				["anchorFrameType"] = "SCREEN",
				["sparkHeight"] = 30,
				["texture"] = "Blizzard",
				["alpha"] = 1,
				["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
				["spark"] = false,
				["tocversion"] = 11302,
				["id"] = "Energy",
				["zoom"] = 0,
				["frameStrata"] = 1,
				["width"] = 182.3,
				["sparkHidden"] = "NEVER",
				["config"] = {
				},
				["inverse"] = false,
				["sparkOffsetX"] = 0,
				["orientation"] = "HORIZONTAL",
				["conditions"] = {
				},
				["backgroundColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					0.5, -- [4]
				},
				["icon"] = false,
			},
		},
		["bJ4ejxY68aj"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1567326579,
			["allowUpdates"] = true,
			["data"] = {
				["backdropColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					0.5, -- [4]
				},
				["controlledChildren"] = {
				},
				["borderBackdrop"] = "Blizzard Tooltip",
				["xOffset"] = 0,
				["border"] = false,
				["yOffset"] = 0,
				["regionType"] = "group",
				["borderSize"] = 2,
				["borderColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["anchorPoint"] = "CENTER",
				["scale"] = 1,
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["names"] = {
							},
							["type"] = "aura2",
							["spellIds"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["event"] = "Health",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
				},
				["authorOptions"] = {
				},
				["internalVersion"] = 23,
				["tocversion"] = 11302,
				["animation"] = {
					["start"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
				},
				["id"] = "Energy Bar + Tick",
				["borderOffset"] = 4,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["config"] = {
				},
				["borderInset"] = 1,
				["uid"] = "bJ4ejxY68aj",
				["subRegions"] = {
				},
				["selfPoint"] = "BOTTOMLEFT",
				["conditions"] = {
				},
				["load"] = {
					["use_class"] = "true",
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "ROGUE",
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["borderEdge"] = "1 Pixel",
			},
		},
		["J3qKxjFJLX5"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1567889659,
			["allowUpdates"] = true,
			["data"] = {
				["outline"] = "OUTLINE",
				["fontSize"] = 32,
				["xOffset"] = 0,
				["color"] = {
					1, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["displayText"] = "Riposte!",
				["regionType"] = "text",
				["yOffset"] = 150,
				["anchorPoint"] = "CENTER",
				["conditions"] = {
				},
				["wordWrap"] = "WordWrap",
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
						["preset"] = "bounceDecay",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "fade",
					},
				},
				["customTextUpdate"] = "update",
				["url"] = "https://wago.io/R7rU8rox1/1",
				["actions"] = {
					["start"] = {
						["sound"] = "Interface\\Addons\\Details\\sounds\\sound_gun3.ogg",
						["do_sound"] = true,
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["duration"] = "5.5",
							["subeventPrefix"] = "SWING",
							["destUnit"] = "player",
							["use_missType"] = true,
							["debuffType"] = "HELPFUL",
							["type"] = "event",
							["missType"] = "PARRY",
							["spellName"] = 14251,
							["use_unit"] = true,
							["event"] = "Combat Log",
							["use_targetRequired"] = true,
							["realSpellName"] = "Riposte",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["unit"] = "player",
							["unevent"] = "timed",
							["use_destUnit"] = true,
							["names"] = {
							},
							["subeventSuffix"] = "_MISSED",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["use_genericShowOn"] = true,
							["genericShowOn"] = "showOnReady",
							["unit"] = "player",
							["realSpellName"] = "Riposte",
							["use_spellName"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Cooldown Progress (Spell)",
							["subeventPrefix"] = "SPELL",
							["use_track"] = true,
							["spellName"] = 14251,
						},
						["untrigger"] = {
							["genericShowOn"] = "showOnReady",
						},
					}, -- [2]
					["disjunctive"] = "all",
					["customTriggerLogic"] = "function(trigger)\n  return trigger[1];\nend",
					["activeTriggerMode"] = -10,
				},
				["font"] = "Friz Quadrata TT",
				["internalVersion"] = 23,
				["justify"] = "LEFT",
				["selfPoint"] = "BOTTOM",
				["id"] = "Riposte!",
				["uid"] = "J3qKxjFJLX5",
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["tocversion"] = 11302,
				["config"] = {
				},
				["version"] = 1,
				["subRegions"] = {
				},
				["automaticWidth"] = "Auto",
				["fixedWidth"] = 200,
				["load"] = {
					["use_class"] = true,
					["use_never"] = false,
					["class"] = {
						["single"] = "ROGUE",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["authorOptions"] = {
				},
			},
		},
		["Xpswt5uiwYS"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1567326579,
			["allowUpdates"] = true,
			["data"] = {
				["sparkWidth"] = 10,
				["sparkOffsetX"] = 0,
				["parent"] = "Energy Bar + Tick",
				["yOffset"] = -168.611129760742,
				["anchorPoint"] = "CENTER",
				["sparkRotation"] = 0,
				["sparkRotationMode"] = "AUTO",
				["icon"] = false,
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "custom",
							["subeventSuffix"] = "_CAST_START",
							["event"] = "Health",
							["subeventPrefix"] = "SPELL",
							["unit"] = "player",
							["spellIds"] = {
							},
							["events"] = "UNIT_POWER_FREQUENT:player ENERGYTICK",
							["custom_type"] = "stateupdate",
							["check"] = "event",
							["names"] = {
							},
							["custom"] = "function(a, e, t)\n    local currEnergy = UnitPower(\"player\", 3)\n    local dur = 2\n    if (e == \"UNIT_POWER_FREQUENT\" and currEnergy > (aura_env.lastEnergy or 0))\n    or (e == \"ENERGYTICK\" and t and currEnergy == UnitPowerMax(\"player\", 3))\n    then\n        if not a[\"\"]  then\n            a[\"\"] = {\n                show = true,\n                changed = true,\n                duration = dur,\n                expirationTime = GetTime() + dur,\n                progressType = \"timed\"\n            }\n        else\n            local s = a[\"\"]\n            s.changed = true\n            s.duration = dur\n            s.expirationTime = GetTime() + dur\n            s.show = true\n            C_Timer.After(2, function() WeakAuras.ScanEvents(\"ENERGYTICK\", true) end)\n        end\n    end\n    aura_env.lastEnergy = currEnergy\n    return true\nend",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					["activeTriggerMode"] = -10,
				},
				["icon_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["internalVersion"] = 23,
				["selfPoint"] = "CENTER",
				["backdropInFront"] = false,
				["barColor"] = {
					1, -- [1]
					0, -- [2]
					0, -- [3]
					0, -- [4]
				},
				["stickyDuration"] = false,
				["sparkOffsetY"] = 0,
				["subRegions"] = {
					{
						["type"] = "aurabar_bar",
					}, -- [1]
					{
						["border_size"] = 16,
						["border_anchor"] = "bar",
						["type"] = "subborder",
						["border_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							0.5, -- [4]
						},
						["border_visible"] = false,
						["border_edge"] = "None",
						["border_offset"] = 5,
					}, -- [2]
				},
				["height"] = 19.4442749023438,
				["load"] = {
					["use_class"] = true,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "ROGUE",
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["sparkBlendMode"] = "ADD",
				["backdropColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					0.5, -- [4]
				},
				["desaturate"] = false,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["authorOptions"] = {
				},
				["useAdjustededMax"] = false,
				["borderBackdrop"] = "Blizzard Tooltip",
				["config"] = {
				},
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["borderInFront"] = true,
				["sparkColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["icon_side"] = "RIGHT",
				["zoom"] = 0,
				["width"] = 181.333297729492,
				["sparkHeight"] = 30,
				["texture"] = "Blizzard",
				["frameStrata"] = 1,
				["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
				["spark"] = true,
				["tocversion"] = 11302,
				["id"] = "energy tick",
				["auto"] = true,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["sparkHidden"] = "NEVER",
				["uid"] = "Xpswt5uiwYS",
				["inverse"] = true,
				["xOffset"] = 5.77812957763672,
				["orientation"] = "HORIZONTAL",
				["conditions"] = {
				},
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["backgroundColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					0, -- [4]
				},
			},
		},
		["2pUHha(ERhl"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1567329593,
			["allowUpdates"] = true,
			["data"] = {
				["backdropColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					0.5, -- [4]
				},
				["controlledChildren"] = {
				},
				["borderBackdrop"] = "Blizzard Tooltip",
				["xOffset"] = 0,
				["border"] = false,
				["yOffset"] = 0,
				["regionType"] = "group",
				["borderSize"] = 2,
				["borderColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["anchorPoint"] = "CENTER",
				["scale"] = 1,
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["names"] = {
							},
							["type"] = "aura2",
							["spellIds"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["event"] = "Health",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
				},
				["authorOptions"] = {
				},
				["internalVersion"] = 23,
				["tocversion"] = 11302,
				["animation"] = {
					["start"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
				},
				["id"] = "Energy Bar + Tick",
				["borderOffset"] = 4,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["config"] = {
				},
				["borderInset"] = 1,
				["uid"] = "bJ4ejxY68aj",
				["subRegions"] = {
				},
				["selfPoint"] = "BOTTOMLEFT",
				["conditions"] = {
				},
				["load"] = {
					["use_class"] = "true",
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "ROGUE",
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["borderEdge"] = "1 Pixel",
			},
		},
		["VoWoe3Nrqn1"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1567888893,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["yOffset"] = 104.66708374023,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = false,
				["icon"] = true,
				["useglowColor"] = false,
				["internalVersion"] = 23,
				["keepAspectRatio"] = false,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = "%s",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_visible"] = true,
						["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
						["anchorYOffset"] = 0,
						["rotateText"] = "NONE",
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["text_fontType"] = "OUTLINE",
					}, -- [1]
				},
				["height"] = 64,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["glowXOffset"] = 0,
				["glowLength"] = 10,
				["regionType"] = "icon",
				["load"] = {
					["class"] = {
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["authorOptions"] = {
				},
				["xOffset"] = -138.00006103516,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["uid"] = "VoWoe3Nrqn1",
				["anchorFrameType"] = "SCREEN",
				["width"] = 64,
				["frameStrata"] = 1,
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "Riposte",
				["glowScale"] = 1,
				["alpha"] = 1,
				["glowYOffset"] = 0,
				["cooldownTextDisabled"] = false,
				["config"] = {
				},
				["inverse"] = false,
				["url"] = "https://wago.io/bpPhvVO7Y/1",
				["triggers"] = {
					{
						["trigger"] = {
							["duration"] = "1",
							["unit"] = "player",
							["debuffType"] = "HELPFUL",
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["use_spellCount"] = false,
							["buffShowOn"] = "showOnActive",
							["event"] = "Action Usable",
							["subeventPrefix"] = "SPELL",
							["realSpellName"] = "Riposte",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["names"] = {
							},
							["unevent"] = "auto",
							["use_unit"] = true,
							["use_targetRequired"] = false,
							["spellName"] = 14251,
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["use_genericShowOn"] = true,
							["genericShowOn"] = "showAlways",
							["unit"] = "player",
							["realSpellName"] = "Riposte",
							["use_spellName"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Cooldown Progress (Spell)",
							["subeventPrefix"] = "SPELL",
							["use_track"] = true,
							["spellName"] = 14251,
						},
						["untrigger"] = {
							["genericShowOn"] = "showAlways",
						},
					}, -- [2]
					["activeTriggerMode"] = -10,
				},
				["conditions"] = {
				},
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["glowBorder"] = false,
			},
		},
		["sNH6SzSVghW"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1567329593,
			["allowUpdates"] = true,
			["data"] = {
				["sparkWidth"] = 10,
				["sparkOffsetX"] = 0,
				["parent"] = "Energy Bar + Tick 2",
				["yOffset"] = -168.611129760742,
				["anchorPoint"] = "CENTER",
				["sparkRotation"] = 0,
				["sparkRotationMode"] = "AUTO",
				["icon"] = false,
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "custom",
							["subeventSuffix"] = "_CAST_START",
							["event"] = "Health",
							["subeventPrefix"] = "SPELL",
							["unit"] = "player",
							["spellIds"] = {
							},
							["events"] = "UNIT_POWER_FREQUENT:player ENERGYTICK",
							["custom_type"] = "stateupdate",
							["check"] = "event",
							["names"] = {
							},
							["custom"] = "function(a, e, t)\n    local currEnergy = UnitPower(\"player\", 3)\n    local dur = 2\n    if (e == \"UNIT_POWER_FREQUENT\" and currEnergy > (aura_env.lastEnergy or 0))\n    or (e == \"ENERGYTICK\" and t and currEnergy == UnitPowerMax(\"player\", 3))\n    then\n        if not a[\"\"]  then\n            a[\"\"] = {\n                show = true,\n                changed = true,\n                duration = dur,\n                expirationTime = GetTime() + dur,\n                progressType = \"timed\"\n            }\n        else\n            local s = a[\"\"]\n            s.changed = true\n            s.duration = dur\n            s.expirationTime = GetTime() + dur\n            s.show = true\n            C_Timer.After(2, function() WeakAuras.ScanEvents(\"ENERGYTICK\", true) end)\n        end\n    end\n    aura_env.lastEnergy = currEnergy\n    return true\nend",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					["activeTriggerMode"] = -10,
				},
				["icon_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["internalVersion"] = 23,
				["selfPoint"] = "CENTER",
				["backdropInFront"] = false,
				["barColor"] = {
					1, -- [1]
					0, -- [2]
					0, -- [3]
					0, -- [4]
				},
				["stickyDuration"] = false,
				["sparkOffsetY"] = 0,
				["subRegions"] = {
					{
						["type"] = "aurabar_bar",
					}, -- [1]
					{
						["border_size"] = 16,
						["border_anchor"] = "bar",
						["type"] = "subborder",
						["border_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							0.5, -- [4]
						},
						["border_visible"] = false,
						["border_edge"] = "None",
						["border_offset"] = 5,
					}, -- [2]
				},
				["height"] = 19.4442749023438,
				["load"] = {
					["use_class"] = true,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "ROGUE",
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["sparkBlendMode"] = "ADD",
				["backdropColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					0.5, -- [4]
				},
				["desaturate"] = false,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["authorOptions"] = {
				},
				["useAdjustededMax"] = false,
				["borderBackdrop"] = "Blizzard Tooltip",
				["config"] = {
				},
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["borderInFront"] = true,
				["sparkColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["icon_side"] = "RIGHT",
				["zoom"] = 0,
				["width"] = 181.333297729492,
				["sparkHeight"] = 30,
				["texture"] = "Blizzard",
				["frameStrata"] = 1,
				["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
				["spark"] = true,
				["tocversion"] = 11302,
				["id"] = "energy tick",
				["auto"] = true,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["sparkHidden"] = "NEVER",
				["uid"] = "Xpswt5uiwYS",
				["inverse"] = true,
				["xOffset"] = 5.77812957763672,
				["orientation"] = "HORIZONTAL",
				["conditions"] = {
				},
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["backgroundColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					0, -- [4]
				},
			},
		},
		["BEIGdMCH8gm"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1567326579,
			["allowUpdates"] = true,
			["data"] = {
				["sparkWidth"] = 10,
				["borderBackdrop"] = "Blizzard Tooltip",
				["authorOptions"] = {
				},
				["yOffset"] = -169.333190917969,
				["anchorPoint"] = "CENTER",
				["sparkRotation"] = 0,
				["sparkRotationMode"] = "AUTO",
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["use_unit"] = true,
							["duration"] = "1",
							["event"] = "Power",
							["names"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["powertype"] = 3,
							["spellIds"] = {
							},
							["use_showCost"] = true,
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["use_powertype"] = true,
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					["activeTriggerMode"] = -10,
				},
				["icon_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["internalVersion"] = 23,
				["selfPoint"] = "CENTER",
				["backdropInFront"] = false,
				["text"] = false,
				["barColor"] = {
					1, -- [1]
					0.909803921568627, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["stickyDuration"] = false,
				["sparkOffsetY"] = 0,
				["subRegions"] = {
					{
						["type"] = "aurabar_bar",
					}, -- [1]
					{
						["text_shadowXOffset"] = 1,
						["type"] = "subtext",
						["text_text"] = "%p",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = -1,
						["text_selfPoint"] = "AUTO",
						["text_fontType"] = "None",
						["text_anchorPoint"] = "INNER_CENTER",
						["anchorYOffset"] = 0,
						["text_visible"] = true,
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
					}, -- [2]
					{
						["text_shadowXOffset"] = 1,
						["type"] = "subtext",
						["text_text"] = "%n",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = -1,
						["text_selfPoint"] = "AUTO",
						["text_fontType"] = "None",
						["text_anchorPoint"] = "INNER_RIGHT",
						["anchorYOffset"] = 0,
						["text_visible"] = false,
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
					}, -- [3]
					{
						["border_size"] = 16,
						["border_anchor"] = "bar",
						["type"] = "subborder",
						["border_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							0.5, -- [4]
						},
						["border_visible"] = false,
						["border_edge"] = "None",
						["border_offset"] = 5,
					}, -- [4]
				},
				["height"] = 21.9999904632568,
				["desaturate"] = false,
				["load"] = {
					["use_class"] = true,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "ROGUE",
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["sparkBlendMode"] = "ADD",
				["useAdjustededMax"] = false,
				["animation"] = {
					["start"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
				},
				["backdropColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					0.5, -- [4]
				},
				["xOffset"] = 6.33369445800781,
				["parent"] = "Energy Bar + Tick",
				["uid"] = "BEIGdMCH8gm",
				["smoothProgress"] = true,
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["borderInFront"] = true,
				["sparkColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["icon_side"] = "RIGHT",
				["auto"] = true,
				["anchorFrameType"] = "SCREEN",
				["sparkHeight"] = 30,
				["texture"] = "Blizzard",
				["alpha"] = 1,
				["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
				["spark"] = false,
				["tocversion"] = 11302,
				["id"] = "Energy",
				["zoom"] = 0,
				["frameStrata"] = 1,
				["width"] = 182.3,
				["sparkHidden"] = "NEVER",
				["config"] = {
				},
				["inverse"] = false,
				["sparkOffsetX"] = 0,
				["orientation"] = "HORIZONTAL",
				["conditions"] = {
				},
				["backgroundColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					0.5, -- [4]
				},
				["icon"] = false,
			},
		},
	},
	["clearOldHistory"] = 30,
	["registered"] = {
	},
	["login_squelch_time"] = 10,
	["frame"] = {
		["xOffset"] = 4.5001220703125,
		["width"] = 845.999938964844,
		["height"] = 484.999786376953,
		["yOffset"] = -20.000244140625,
	},
	["editor_theme"] = "Monokai",
}
