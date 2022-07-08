extends Node

enum {
	FIRE,
	THUNDER,
	ICE,
	WATER,
	POISON,
	SEER,
	CURSE,
	NOVA,
	DEVOUR,
	SUPERNOVA,
}

enum ELEMENTS {
	NONE,
	FIRE,
	THUNDER,
	ICE,
	WATER,
	POISON,
	SHADOW,
}

enum TARGETS {
	SINGLE,
	ALL,
}

const ID = "id"
const NAME = "name"
const DESCRIPTION = "description"
const TYPE = "type"
const POWER = "power"
const ELEMENT = "element"
const TARGET = "target"

var id = {
	str(FIRE):{
		ID:Abilities.FIRE,
		NAME:"Fire",
		DESCRIPTION:"Deals Fire damage to a single target.",
		TYPE:Abilities.ABILITY_TYPE.OFFENSIVE,
		POWER:2,
		ELEMENT:ELEMENTS.FIRE
	},
	str(THUNDER):{
		ID:Abilities.THUNDER,
		NAME:"Thunder",
		DESCRIPTION:"Deals Thunder damage to a single target.",
		TYPE:Abilities.ABILITY_TYPE.OFFENSIVE,
		POWER:2,
		ELEMENT:ELEMENTS.THUNDER
	},
	str(ICE):{
		ID:Abilities.ICE,
		NAME:"Ice",
		DESCRIPTION:"Deals Ice damage to a single target.",
		TYPE:Abilities.ABILITY_TYPE.OFFENSIVE,
		POWER:2,
		ELEMENT:ELEMENTS.ICE
	},
	str(WATER):{
		ID:Abilities.WATER,
		NAME:"Water",
		DESCRIPTION:"Deals Water damage to a single target.",
		TYPE:Abilities.ABILITY_TYPE.OFFENSIVE,
		POWER:2,
		ELEMENT:ELEMENTS.WATER
	},	
	str(POISON):{
		ID:Abilities.POISON,
		NAME:"Poison",
		DESCRIPTION:"Deals Poison damage over time.",
		TYPE:Abilities.ABILITY_TYPE.OFFENSIVE,
		POWER:2,
		ELEMENT:ELEMENTS.POISON
	},
	str(SEER):{
		ID:Abilities.SEER,
		NAME:"Seer",
		DESCRIPTION:"Discover HP of enemy.",
		TYPE:Abilities.ABILITY_TYPE.OFFENSIVE,
		POWER:0,
		ELEMENT:ELEMENTS.NONE
	},
	str(CURSE):{
		ID:Abilities.CURSE,
		NAME:"Curse",
		DESCRIPTION:"Something to do with Shadow damage.",
		TYPE:Abilities.ABILITY_TYPE.OFFENSIVE,
		POWER:2,
		ELEMENT:ELEMENTS.SHADOW
	},
	str(NOVA):{
		ID:Abilities.NOVA,
		NAME:"Nova",
		DESCRIPTION:"Deals massive damage to all targets.",
		TYPE:Abilities.ABILITY_TYPE.OFFENSIVE,
		POWER:2,
		ELEMENT:ELEMENTS.NONE
	}
}
