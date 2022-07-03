extends Node


var battle_scene = preload("res://Battle/Battle.tscn")

var encounter_id = 0
var player_party = []

func _ready() -> void:
	begin_battle()
	
	
func new_game() -> void:
	# Set values to their defaults
	# Start intro
	pass


func begin_battle() -> void:
	var battle = battle_scene.instance()
	add_child(battle)
	Events.emit_signal("battle_started", [encounter_id, player_party])
