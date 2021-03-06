
local myname, ns = ...


-- These priorities are taken from the wonderful folks at Icy Veins
-- http://www.icy-veins.com/wow/class-guides
local prios = {
	-- [250] = "DK_BLOOD",
	-- [251] = "DK_FROST",
	-- [252] = "DK_UNHOLY",

	-- Druid
	[102] = { -- Balance
		STAT_HASTE,
		STAT_CRITICAL_STRIKE,
		STAT_VERSATILITY,
		STAT_MASTERY,
	},
	[103] = { -- Feral
		STAT_MASTERY,
		STAT_CRITICAL_STRIKE,
		STAT_VERSATILITY,
		STAT_HASTE,
	},
	[104] = { -- Guardian
		STAT_VERSATILITY,
		STAT_MASTERY,
		STAT_HASTE,
		STAT_CRITICAL_STRIKE,
	},
	[105] = { -- Restoration
		STAT_HASTE,
		STAT_CRITICAL_STRIKE,
		STAT_MASTERY,
		STAT_VERSATILITY,
	},

	-- Hunter
	[253] = { -- Beast master
		STAT_MASTERY,
		STAT_HASTE,
		STAT_CRITICAL_STRIKE,
		STAT_VERSATILITY,
		-- Weapon DPS
	},
	[254] = { -- Marksmanship
		-- Weapon DPS,
		STAT_MASTERY,
		STAT_HASTE,
		STAT_VERSATILITY,
		STAT_CRITICAL_STRIKE,
	},
	[255] = { -- Survival
		-- Weapon DPS,
		STAT_VERSATILITY,
		STAT_CRITICAL_STRIKE,
		STAT_HASTE,
		STAT_MASTERY,
	},

	-- [74] = "HUNTER_PET_FEROCITY",
	-- [79] = "HUNTER_PET_CUNNING",
	-- [81] = "HUNTER_PET_TENACITY",

	-- Mage
	[62] = { -- Arcane
		STAT_MASTERY,
		STAT_CRITICAL_STRIKE,
		STAT_VERSATILITY,
		STAT_HASTE,
	},
	[63] = { -- Fire
		STAT_CRITICAL_STRIKE,
		STAT_MASTERY,
		STAT_HASTE,
		STAT_VERSATILITY,
	},
	[64] = { -- Frost
		STAT_HASTE,
		STAT_CRITICAL_STRIKE.. " (to 36.33%)",
		STAT_VERSATILITY,
		STAT_MASTERY,
		STAT_CRITICAL_STRIKE.. " (above 36.33%)",
	},

	-- Monk
	[268] = { -- Brewmaster
		STAT_HASTE.." (to 15%)",
		STAT_VERSATILITY,
		STAT_MASTERY,
		STAT_HASTE.." (to 33.4%)",
		STAT_CRITICAL_STRIKE,
		STAT_HASTE.." (above 33.4%)"
	},
	[270] = { -- Mistweaver
		{
			title="Dungeons",
			STAT_HASTE,
			STAT_MASTERY,
			STAT_CRITICAL_STRIKE,
			STAT_VERSATILITY
		},
		{
			title="Raids",
			STAT_CRITICAL_STRIKE,
			STAT_VERSATILITY,
			STAT_HASTE,
			STAT_MASTERY
		},
		{
			title="Fistweaving",
			STAT_HASTE,
			STAT_CRITICAL_STRIKE,
			STAT_VERSATILITY,
			STAT_MASTERY
		}
	},
	[269] = { -- Windwalker
		STAT_MASTERY,
		STAT_CRITICAL_STRIKE,
		STAT_VERSATILITY,
		STAT_HASTE
	},

	-- Paladin
	[65] = { -- Holy
		STAT_CRITICAL_STRIKE,
		STAT_MASTERY,
		STAT_VERSATILITY,
		STAT_HASTE,
	},
	[66] = { -- Protection
		STAT_VERSATILITY,
		STAT_HASTE,
		STAT_MASTERY,
		STAT_CRITICAL_STRIKE,
	},
	[70] = { -- Retribution
		STAT_HASTE,
		STAT_CRITICAL_STRIKE,
		STAT_MASTERY,
		STAT_VERSATILITY,
	},

	-- Priest
	[256] = { -- Discipline
		STAT_HASTE,
	},
	[257] = { -- Holy
		STAT_MASTERY,
	},
	[258] = { -- Shadow (spell power?)
		STAT_HASTE,
	},

	-- [259] = "ROGUE_ASS",
	-- [260] = "ROGUE_COMBAT",
	-- [261] = "ROGUE_SUB",

	-- Shaman
	[262] = { -- Elemental
		STAT_CRITICAL_STRIKE,
		STAT_HASTE,
		STAT_VERSATILITY,
		STAT_MASTERY,
	},
	[263] = { -- Enhancement
		STAT_MASTERY,
		STAT_HASTE,
		STAT_VERSATILITY,
		STAT_CRITICAL_STRIKE,
	},
	[264] = { -- Restoration
		STAT_MASTERY,
		STAT_CRITICAL_STRIKE,
		STAT_HASTE,
		STAT_VERSATILITY,
	},

	-- [265] = "WARLOCK_AFFLICTION",
	-- [266] = "WARLOCK_DEMO",
	-- [267] = "WARLOCK_DESTRO",

	-- [71] = "WARRIOR_ARMS",
	-- [72] = "WARRIOR_FURY",
	-- [73] = "WARRIOR_PROT",

	-- Demon Hunter
	[577] = { -- Havoc
		STAT_CRITICAL_STRIKE,
		STAT_MASTERY,
		STAT_HASTE,
		STAT_VERSATILITY,
	},
	[581] = { -- Vengeance
		{
			title="Survivability",
			STAT_MASTERY,
			STAT_VERSATILITY,
			STAT_HASTE,
			STAT_CRITICAL_STRIKE,
		},
		{
			title="Damage Output",
			STAT_CRITICAL_STRIKE,
			STAT_VERSATILITY,
			STAT_MASTERY,
			STAT_HASTE,
		}
	}
}


local default = {"???"}
ns.priorities = setmetatable(prios, {
	__index = function(t,i) return default end
})
