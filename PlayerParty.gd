extends Node

enum {
	PLAYER,
	MELINDA,
	
}

const NAME = "name"
const HP_CURRENT = "hp_current"
const HP_MAX = "hp_max"
const LEVEL = "level"
const EXP_CURRENT = "exp_current"
const EXP_NEXT = "exp_next"
const STRENGTH = "strength"
const SPEED = "speed"
const SORCERY = "sorcery"
const DEFENSE = "defense"
const ABILITIES = "abilities"
const SPELLS = "spells"
const SPELL_POINTS_CURRENT = "spell_points_current"
const SPELL_POINTS_MAX = "spell_points_max"
const IS_DEAD = "is_dead"
const ITEM_QUANTITY = "item_quantity"


var id: Dictionary = {
	str(PLAYER):{
		NAME:"Player",
		LEVEL:1,
		EXP_CURRENT:0,
		EXP_NEXT:100,
		HP_MAX:100,
		HP_CURRENT:100,
		STRENGTH:3,
		SPEED:2,
		SORCERY:0,
		DEFENSE:2,
		ABILITIES:[
			Abilities.id[str(Abilities.ATTACK)],
			Abilities.id[str(Abilities.ITEM)],
			Abilities.id[str(Abilities.ESCAPE)]
		],
		SPELLS:[
			{}
		],
		IS_DEAD:false,
	},
	str(MELINDA):{
		NAME:"Melinda",
		LEVEL:5,
		EXP_CURRENT:0,
		EXP_NEXT:100,
		HP_MAX:150,
		HP_CURRENT:150,
		STRENGTH:1,
		SPEED:3,
		SORCERY:4,
		DEFENSE:2,
		ABILITIES:[
			Abilities.id[str(Abilities.ATTACK)],
			Abilities.id[str(Abilities.SORCERY)],
			Abilities.id[str(Abilities.ITEM)],
			Abilities.id[str(Abilities.ESCAPE)]
		],
		SPELLS:[
			{str(Spells.FIRE):{
				SPELL_POINTS_CURRENT:5,
				SPELL_POINTS_MAX:5
			}},
			{str(Spells.THUNDER):{
				SPELL_POINTS_CURRENT:5,
				SPELL_POINTS_MAX:5
			}},
			{str(Spells.ICE):{
				SPELL_POINTS_CURRENT:5,
				SPELL_POINTS_MAX:5
			}},
			{str(Spells.WATER):{
				SPELL_POINTS_CURRENT:5,
				SPELL_POINTS_MAX:5
			}},
			{str(Spells.POISON):{
				SPELL_POINTS_CURRENT:5,
				SPELL_POINTS_MAX:5
			}},
			{str(Spells.CURSE):{
				SPELL_POINTS_CURRENT:5,
				SPELL_POINTS_MAX:5
			}},
			{str(Spells.SEER):{
				SPELL_POINTS_CURRENT:5,
				SPELL_POINTS_MAX:5
			}},
			{str(Spells.NOVA):{
				SPELL_POINTS_CURRENT:5,
				SPELL_POINTS_MAX:5
			}},
		],
		IS_DEAD:false,
	},
}


var items: Dictionary = {
	str(Items.POTION):{
		ITEM_QUANTITY:5
	},
	str(Items.AETHER):{
		ITEM_QUANTITY:2
	}
}


var current_party: Array = []


func add_to_party(value) -> void:
	current_party.append(value)

	
func remove_from_party(value) -> void:
	current_party.remove(value)
	

func level_up_member(_member) -> void:
	pass
