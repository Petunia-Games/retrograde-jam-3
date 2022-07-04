extends Node

enum ABILITIES {
	ATTACK_LEVEL_1,
	ATTACK_LEVEL_2,
	ATTACK_LEVEL_3,
	ATTACK_LEVEL_4,
	FIRE,
	THUNDER,
	ICE,
	WATER,
	SEER,
	POISON,
	CURSE, # what should this do?
	NOVA,
	# Enemy specific abilities
	DEVOUR,
}

enum ELEMENTAL_TYPE {
	NON_ELEMENTAL,
	FIRE_ELEMENTAL,
	THUNDER_ELEMENTAL,
	ICE_ELEMENTAL,
	WATER_ELEMENTAL,
	POISON_ELEMENTAL,
	SHADOW_ELEMENTAL,
}


const ABILITY_TYPE = "ability_type"
const ABILITY_POWER = "ability_power"
const ABILITY_DESCRIPTION = "ability_description"


var abilities: Dictionary = {
	str(ABILITIES.ATTACK_LEVEL_1):{
		ABILITY_TYPE:ELEMENTAL_TYPE.NON_ELEMENTAL,
		ABILITY_POWER:1,
		ABILITY_DESCRIPTION:"",
	},
	str(ABILITIES.ATTACK_LEVEL_2):{
		ABILITY_TYPE:ELEMENTAL_TYPE.NON_ELEMENTAL,
		ABILITY_POWER:2,
		ABILITY_DESCRIPTION:"",
	},
	str(ABILITIES.ATTACK_LEVEL_3):{
		ABILITY_TYPE:ELEMENTAL_TYPE.NON_ELEMENTAL,
		ABILITY_POWER:4,
		ABILITY_DESCRIPTION:"",
	},
	str(ABILITIES.ATTACK_LEVEL_4):{
		ABILITY_TYPE:ELEMENTAL_TYPE.NON_ELEMENTAL,
		ABILITY_POWER:8,
		ABILITY_DESCRIPTION:"",
	},
	str(ABILITIES.FIRE):{
		ABILITY_TYPE:ELEMENTAL_TYPE.FIRE_ELEMENTAL,
		ABILITY_POWER:2,
		ABILITY_DESCRIPTION:"",
	},
	str(ABILITIES.THUNDER):{
		ABILITY_TYPE:ELEMENTAL_TYPE.THUNDER_ELEMENTAL,
		ABILITY_POWER:2,
		ABILITY_DESCRIPTION:"",
	},
	str(ABILITIES.ICE):{
		ABILITY_TYPE:ELEMENTAL_TYPE.ICE_ELEMENTAL,
		ABILITY_POWER:2,
		ABILITY_DESCRIPTION:"",
	},
	str(ABILITIES.WATER):{
		ABILITY_TYPE:ELEMENTAL_TYPE.WATER_ELEMENTAL,
		ABILITY_POWER:2,
		ABILITY_DESCRIPTION:"",
	},
	str(ABILITIES.SEER):{
		ABILITY_TYPE:ELEMENTAL_TYPE.NON_ELEMENTAL,
		ABILITY_POWER:0,
		ABILITY_DESCRIPTION:"Discover life force of enemy.",
	},
	str(ABILITIES.POISON):{
		ABILITY_TYPE:ELEMENTAL_TYPE.POISON_ELEMENTAL,
		ABILITY_POWER:4,
		ABILITY_DESCRIPTION:"",
	},
	str(ABILITIES.CURSE):{
		ABILITY_TYPE:ELEMENTAL_TYPE.SHADOW_ELEMENTAL,
		ABILITY_POWER:8,
		ABILITY_DESCRIPTION:"",
	},
	str(ABILITIES.NOVA):{
		ABILITY_TYPE:ELEMENTAL_TYPE.NON_ELEMENTAL,
		ABILITY_POWER:16,
		ABILITY_DESCRIPTION:"",
	},
	str(ABILITIES.DEVOUR):{
		ABILITY_TYPE:ELEMENTAL_TYPE.NON_ELEMENTAL,
		ABILITY_POWER:2,
		ABILITY_DESCRIPTION:"",
	},
}


var player_party: Array = []
var enemy_party: Array = []

var enemy_stats_known = []

var turn_number: int = 1
var turn_queue: Array = []

func add_player_member(member) -> void:
	player_party.append(member)
	
	
func add_enemy_member(member) -> void:
	enemy_party.append(member)


func remove_player_member(member_index) -> void:
	# TODO: Safety checks
	player_party.remove(member_index)
	
	
func remove_enemy_member(member_index) -> void:
	# TODO: Safety checks
	enemy_party.remove(member_index)

func add_action_to_turn_queue(from, to, action) -> void:
	var turn: Array = [from, to, action]
	turn_queue.append(turn)
