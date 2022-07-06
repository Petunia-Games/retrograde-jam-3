extends Node

enum {
	POTION,
	AETHER
}

const NAME = "name"
const DESCRIPTION = "description"
const TYPE = "type"

var id: Dictionary = {
	str(POTION):{
		NAME:"Potion",
		DESCRIPTION:"Restores 100HP.",
		TYPE:Abilities.ABILITY_TYPE.DEFENSIVE
	},
	str(AETHER):{
		NAME:"Aether",
		DESCRIPTION:"Restores Sorcery.",
		TYPE:Abilities.ABILITY_TYPE.DEFENSIVE
	}
}
