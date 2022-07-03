extends Node

const NAME = "name"
const HP_CURRENT = "hp_current"
const HP_MAX = "hp_max"
const LEVEL = "level"
const EXP_CURRENT = "exp_current"
const EXP_NEXT = "exp_next"
const ABILITIES = "abilities"
const ATTACK = "Attack"
const SORCERY = "Sorcery"
const ITEM = "Item"
const ESCAPE = "Escape"



var char_1: Dictionary = {
	NAME:"char_1",
	HP_CURRENT:120,
	HP_MAX:120,
	LEVEL:1,
	EXP_CURRENT:0,
	EXP_NEXT:100,
	ABILITIES:[
		ATTACK,
		ITEM,
		ESCAPE
	]
}

var char_2: Dictionary = {
	NAME:"char_2",
	HP_CURRENT:100,
	HP_MAX:100,
	LEVEL:1,
	EXP_CURRENT:0,
	EXP_NEXT:100,
	ABILITIES:[
		ATTACK,
		SORCERY,
		ITEM,
		ESCAPE
	]
}

var char_3: Dictionary = {
	NAME:"char_3",
	HP_CURRENT:150,
	HP_MAX:150,
	LEVEL:1,
	EXP_CURRENT:0,
	EXP_NEXT:100,
	ABILITIES:[
		ATTACK,
		SORCERY,
		ITEM,
		ESCAPE
	]
}


var items: Dictionary = {
	
}


var current_party: Array = []


func add_to_party(value) -> void:
	current_party.append(value)

	
func remove_from_party(value) -> void:
	current_party.remove(value)
	

func level_up_member(member) -> void:
	pass
