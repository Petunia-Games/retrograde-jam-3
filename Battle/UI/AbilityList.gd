# Battle/UI/AbilityList.gd
extends NinePatchRect

onready var list: VBoxContainer = $VBoxContainer

var ability_scene = preload("res://Battle/UI/Ability.tscn")
var selected_ability_index = 0

func process_input() -> void:
	if Input.is_action_just_pressed("up"):
		select_previous_ability()
		Events.emit_signal("audio_sfx_started", Audio.id[str(Audio.UI_MOVE_CURSOR)])
	elif Input.is_action_just_pressed("down"):
		select_next_ability()
		Events.emit_signal("audio_sfx_started", Audio.id[str(Audio.UI_MOVE_CURSOR)])
	
	if Input.is_action_just_pressed("confirm"):
		Events.emit_signal("battle_ability_selected", list.get_child(selected_ability_index))
	elif Input.is_action_just_pressed("select"):
		Events.emit_signal("battle_member_changed")
		
		
func add_ability_to_list(ability_info) -> void:
	var ability = ability_scene.instance()
	list.add_child(ability)
	ability.set_data(ability_info)
	
	
func populate_list(member) -> void:
	# TODO: Safety checks
	# Get ability list from member and add them to the list
	clear_list()
	for ability in member.abilities:
		add_ability_to_list(ability)
		
	selected_ability_index = 0
	list.get_child(selected_ability_index).set_selected()
	
	
func clear_list() -> void:
	if list.get_child_count() == 0:
		return
	for child in list.get_children():
		child.free()
	
	
func select_next_ability() -> void:
	list.get_child(selected_ability_index).set_deselected()
	selected_ability_index = (selected_ability_index + 1) % list.get_child_count()
	list.get_child(selected_ability_index).set_selected()
	

func select_previous_ability() -> void:
	list.get_child(selected_ability_index).set_deselected()
	if selected_ability_index == 0:
		selected_ability_index = list.get_child_count() - 1
	else:
		selected_ability_index = selected_ability_index - 1
	list.get_child(selected_ability_index).set_selected()
