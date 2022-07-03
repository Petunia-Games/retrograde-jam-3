extends Node


var battle_scene = preload("res://Battle/Battle.tscn")


func _ready() -> void:
	begin_battle()
	new_game()
	
	
func new_game() -> void:
	# Set values to their defaults
	# Start intro
	pass


func begin_battle() -> void:
	var battle = battle_scene.instance()
	add_child(battle)
