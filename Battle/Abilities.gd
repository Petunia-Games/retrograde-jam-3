extends Node

enum {
	ATTACK,
	SORCERY,
	ITEM,
	ESCAPE
}

enum SUBMENUS {
	NONE,
	SPELLS,
	ITEMS,
	TARGETS
}

enum ABILITY_TYPE {
	OFFENSIVE,
	DEFENSIVE
}


const NAME = "name"
const DESCRIPTION = "description"
const TYPE = "type"
const SUBMENU = "submenu"

var id = {
	str(ATTACK):{
		NAME:"Attack",
		DESCRIPTION:"You attack...",
		TYPE:ABILITY_TYPE.OFFENSIVE,
		SUBMENU:SUBMENUS.TARGETS
	},
	str(SORCERY):{
		NAME:"Sorcery",
		DESCRIPTION:"Use spells.",
		TYPE:ABILITY_TYPE.OFFENSIVE,
		SUBMENU:SUBMENUS.SPELLS
	},
	str(ITEM):{
		NAME:"Item",
		DESCRIPTION:"Use an item.",
		TYPE:ABILITY_TYPE.DEFENSIVE,
		SUBMENU:SUBMENUS.ITEMS
	},
	str(ESCAPE):{
		NAME:"Escape",
		DESCRIPTION:"Attempt to escape from battle.",
		TYPE:ABILITY_TYPE.DEFENSIVE,
		SUBMENU:SUBMENUS.NONE
	},
}
