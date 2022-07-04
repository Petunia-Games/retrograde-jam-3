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

const NAME = "name"
const DESCRIPTION = "description"
const SUBMENU = "submenu"

var id = {
	str(ATTACK):{
		NAME:"Attack",
		DESCRIPTION:"You attack...",
		SUBMENU:SUBMENUS.TARGETS
	},
	str(SORCERY):{
		NAME:"Sorcery",
		DESCRIPTION:"Use spells.",
		SUBMENU:SUBMENUS.SPELLS
	},
	str(ITEM):{
		NAME:"Item",
		DESCRIPTION:"Use an item.",
		SUBMENU:SUBMENUS.ITEMS
	},
	str(ESCAPE):{
		NAME:"Escape",
		DESCRIPTION:"Attempt to escape from battle.",
		SUBMENU:SUBMENUS.NONE
	},
}
