extends HBoxContainer

onready var player_list: VBoxContainer = $PlayerList
onready var enemy_list: VBoxContainer = $EnemyList


func add_player(player_scene) -> void:
	player_list.add_child(player_scene)
	
	
func add_enemy(enemy_scene) -> void:
	enemy_list.add_child(enemy_scene)
