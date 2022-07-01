extends Node

var current_party: Array = []


func add_to_party(value) -> void:
	current_party.append(value)

	
func remove_from_party(value) -> void:
	current_party.remove(value)
	

