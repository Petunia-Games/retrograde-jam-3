# Battle/TargetList.gd
extends HBoxContainer

onready var enemy_target_list: VBoxContainer = $EnemyTargets
onready var player_target_list: VBoxContainer = $PlayerTargets

var target_scene = preload("res://Battle/UI/Target.tscn")
var current_target_list = null
var selected_target_index = 0

var action
var from
var to

func process_input() -> void:
	if Input.is_action_just_pressed("up"):
		pass
	elif Input.is_action_just_pressed("down"):
		pass
	elif Input.is_action_just_pressed("left"):
		pass
	elif Input.is_action_just_pressed("right"):
		pass
	
	if Input.is_action_just_pressed("confirm"):
		to = current_target_list.get_child(selected_target_index)
		Events.emit_signal("battle_target_selected", action, from, to)
	elif Input.is_action_just_pressed("cancel"):
		Events.emit_signal("battle_submenu_cancelled")
	elif Input.is_action_just_pressed("select"):
		Events.emit_signal("battle_member_changed")


func add_target_to_list(target_data) -> void:
	var target = target_scene.instance()
	current_target_list.add_child(target)
	target.set_data(target_data)
	


func populate_list(ability) -> void:
	action = ability
	from = BattleGlobals.active_player_party_members[BattleGlobals.active_party_member_index]
	clear_list()
	
	match ability.type:
		Abilities.ABILITY_TYPE.OFFENSIVE:
			current_target_list = enemy_target_list
			for target in BattleGlobals.enemy_party:
				current_target_list = enemy_target_list
				add_target_to_list(target)
		Abilities.ABILITY_TYPE.DEFENSIVE:
			current_target_list = player_target_list
			for target in BattleGlobals.player_party:
				current_target_list = player_target_list
				add_target_to_list(target)
			
	selected_target_index = 0
	current_target_list.get_child(selected_target_index).set_selected()


func clear_list() -> void:
	if not enemy_target_list.get_child_count() == 0:
		for child in enemy_target_list.get_children():
			child.free()
		
	if not player_target_list.get_child_count() == 0:
		for child in player_target_list.get_children():
			child.free()
