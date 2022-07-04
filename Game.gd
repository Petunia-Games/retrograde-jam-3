extends Node

var battle_scene = preload("res://Battle/Battle.tscn")
var map_scene = preload("res://Battle/Map/Map.tscn")

func _ready() -> void:
	Globals.encounter_id = 0
	Globals.field_id = 0
	Globals.current_party = [0]
	begin_battle()
	
	
func new_game() -> void:
	# Set values to their defaults
	# Start intro
	pass


func begin_battle() -> void:
	var battle = battle_scene.instance()
	add_child(battle)
	Events.emit_signal("battle_started")
