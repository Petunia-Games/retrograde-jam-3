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
			# Calculate random damage based on attacker str and opponent def
			# attack*(100/(100+defense)) ?
			pass
		ESCAPE:
			# Check if encounter is escapable (store that in the enc id?)
			# If so:
			#		Loop through enemies and get the highest "escape difficulty" value
			#		Generate a random number between 0 and 255
			#		If it is above the "escape difficulty", emit escape signal
			if BattleGlobals.can_escape:
				var rand = randi() % 256
				if rand > BattleGlobals.get_escape_difficulty():
					Events.emit_signal("battle_escaped")
		FIRE:
			pass
		THUNDER:
			pass
		ICE:
			pass
		WATER:
			pass
		POISON:
			pass
		SEER:
			Events.emit_signal("audio_sfx_started", Audio.id[str(Audio.SPELL_SEER)])
		CURSE:
			pass
		NOVA:
			pass
		DEVOUR:
			pass
		SUPERNOVA:
			pass
		POTION:
			pass
		AETHER:
			pass
		REVIVE:
			pass
