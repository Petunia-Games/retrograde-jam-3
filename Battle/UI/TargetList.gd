# Battle/TargetList.gd
extends VBoxContainer

var target_scene = preload("res://Battle/UI/Target.tscn")
var selected_target_index = 0

var action
var from
var to

func process_input() -> void:
	if Input.is_action_just_pressed("up"):
		select_previous_target()
		Events.emit_signal("audio_sfx_started", Audio.id[str(Audio.MOVE_CURSOR)])
	elif Input.is_action_just_pressed("down"):
		select_next_target()
		Events.emit_signal("audio_sfx_started", Audio.id[str(Audio.MOVE_CURSOR)])
	
	if Input.is_action_just_pressed("confirm"):
		to = get_child(selected_target_index)
		Events.emit_signal("battle_target_selected", action, from, to)
	elif Input.is_action_just_pressed("cancel"):
		Events.emit_signal("battle_submenu_cancelled")
	elif Input.is_action_just_pressed("select"):
		Events.emit_signal("battle_member_changed")


func add_target_to_list(target_data) -> void:
	var target = target_scene.instance()
	add_child(target)
	target.set_data(target_data)
	

func populate_list(ability) -> void:
	action = ability
	from = BattleGlobals.active_player_party_members[BattleGlobals.active_party_member_index]
	clear_list()
	
	match ability.type:
		Abilities.ABILITY_TYPE.OFFENSIVE:
			for target in BattleGlobals.enemy_party:
				add_target_to_list(target)
		Abilities.ABILITY_TYPE.DEFENSIVE:
			for target in BattleGlobals.player_party:
				add_target_to_list(target)
			
	selected_target_index = 0
	get_child(selected_target_index).set_selected()


func clear_list() -> void:
	if not get_child_count() == 0:
		for child in get_children():
			child.free()


func select_next_target() -> void:
	get_child(selected_target_index).set_deselected()
	selected_target_index = (selected_target_index + 1) % get_child_count()
	get_child(selected_target_index).set_selected()
	

func select_previous_target() -> void:
	get_child(selected_target_index).set_deselected()
	if selected_target_index == 0:
		selected_target_index = get_child_count() - 1
	else:
		selected_target_index = selected_target_index - 1
	get_child(selected_target_index).set_selected()
