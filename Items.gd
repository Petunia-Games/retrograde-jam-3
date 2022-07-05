extends Node

enum {
	POTION,
	AETHER
}

const NAME = "name"
const DESCRIPTION = "description"

var id: Dictionary = {
	str(POTION):{
		NAME:"Potion",
		DESCRIPTION:"Restores 100HP."
	},
	str(AETHER):{
		NAME:"Aether",
		DESCRIPTION:"Restores Sorcery."
	}
}
