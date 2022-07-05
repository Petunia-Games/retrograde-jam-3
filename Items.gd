extends Node

enum {
	POTION,
	TEST
}

const NAME = "name"
const DESCRIPTION = "description"

var id: Dictionary = {
	str(POTION):{
		NAME:"Potion",
		DESCRIPTION:"Heals 100HP."
	},
	str(TEST):{
		NAME:"Test",
		DESCRIPTION:"Test item."
	}
}
