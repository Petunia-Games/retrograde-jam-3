extends Node

enum {
	TEST,
	HOUND,
	
}

const NAME = "name"
const LEVEL = "level"
const EXP = "exp"
const ESCAPE_DIFFICULTY = "escape_difficulty"
const HP = "hp"
const STRENGTH = "strength"
const SPEED = "speed"
const SORCERY = "socery"
const DEFENSE = "defense"
const ITEMS = "items"

const AI_SCRIPT = "ai_script"


var id = {
	str(TEST):{
		NAME:"Test",
		LEVEL:1,
		EXP:1,
		ESCAPE_DIFFICULTY:50,
		HP:50,
		STRENGTH:1,
		SPEED:1,
		SORCERY:1,
		DEFENSE:1,
		ITEMS:[{}],
		AI_SCRIPT:"res://Battle/Enemies/Test.gd",
	},
	str(HOUND):{
		NAME:"Hound",
		LEVEL:1,
		EXP:10,
		ESCAPE_DIFFICULTY:50,
		HP:50,
		STRENGTH:2,
		SPEED:3,
		SORCERY:2,
		DEFENSE:1,
		ITEMS:[{}],
		AI_SCRIPT:"res://Battle/Enemies/Hound.gd",
	},
}
