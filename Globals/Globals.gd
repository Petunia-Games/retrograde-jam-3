extends Node


var text_speed: int = 3

var current_party: Array = [] # Contains the ID?
var field_id: int
var encounter_id: int


func add_to_current_party(member) -> void:
	current_party.append(member)
