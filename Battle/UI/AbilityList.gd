extends NinePatchRect

onready var list: VBoxContainer = $VBoxContainer

var ability_scene = preload("res://Battle/UI/Ability.tscn")
var selected_ability = 0

func process_input() -> void:
	if Input.is_action_just_pressed("up"):
		select_previous_ability()
	elif Input.is_action_just_pressed("down"):
		select_next_ability()
	
	if Input.is_action_just_pressed("confirm"):
		Events.emit_signal("battle_ability_selected", get_child(selected_ability))
	
	
func add_ability_to_list(ability_info) -> void:
	var ability = ability_scene.instance()
	list.add_child(ability)
	ability.set_data(ability_info)
	
	
func populate_list(member) -> void:
	# Get ability list from member and add them to the list
	clear_list()
	for ability in member.abilities:
		add_ability_to_list(ability)
		
	list.get_child(0).set_selected()
	
func clear_list() -> void:
	if list.get_child_count() == 0:
		return
	for child in list.get_children():
		child.queue_free()
	
	
func select_next_ability() -> void:
	pass
	

func select_previous_ability() -> void:
	pass
