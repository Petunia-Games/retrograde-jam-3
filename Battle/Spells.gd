extends Node

enum {
	FIRE,
	THUNDER,
	ICE,
	WATER,
	POISON,
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

const NAME = "name"
const DESCRIPTION = "description"
const POWER = "power"
const ELEMENT = "element"


var id = {
	str(FIRE):{
		NAME:"Fire",
		DESCRIPTION:"Deals Fire elemental damage to a single target.",
		POWER:2,
		ELEMENT:ELEMENTS.FIRE
	}
}
