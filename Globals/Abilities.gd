extends Node

enum {
	ATTACK,
	SORCERY,
	ITEM,
	ESCAPE,
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
	POTION,
	AETHER,
	REVIVE,
	
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

const ID = "id"
const NAME = "name"
const DESCRIPTION = "description"
const TYPE = "type"
const SUBMENU = "submenu"


var id = {
	str(ATTACK):{
		ID:ATTACK,
		NAME:"Attack",
		DESCRIPTION:"You attack...",
		TYPE:ABILITY_TYPE.OFFENSIVE,
		SUBMENU:SUBMENUS.TARGETS
	},
	str(SORCERY):{
		ID:SORCERY,
		NAME:"Sorcery",
		DESCRIPTION:"Use spells.",
		TYPE:ABILITY_TYPE.OFFENSIVE,
		SUBMENU:SUBMENUS.SPELLS
	},
	str(ITEM):{
		ID:ITEM,
		NAME:"Item",
		DESCRIPTION:"Use an item.",
		TYPE:ABILITY_TYPE.DEFENSIVE,
		SUBMENU:SUBMENUS.ITEMS
	},
	str(ESCAPE):{
		ID:ESCAPE,
		NAME:"Escape",
		DESCRIPTION:"Attempt to escape from battle.",
		TYPE:ABILITY_TYPE.DEFENSIVE,
		SUBMENU:SUBMENUS.NONE
	},
}


func do_action(action) -> void:
	match action[BattleGlobals.ACTION]:
		ATTACK:
			pass
		ESCAPE:
			pass
		FIRE:
			pass
		THUNDER:
			pass
