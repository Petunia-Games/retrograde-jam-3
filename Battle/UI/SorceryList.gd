# SorceryList.gd
extends GridContainer

var spell_scene = preload("res://Battle/UI/Spell.tscn")
var selected_spell_index = 0
var current_column = 0

func process_input() -> void:
	if Input.is_action_just_pressed("up"):
		select_previous_spell_in_column()
	elif Input.is_action_just_pressed("down"):
		select_next_spell_in_column()
	elif Input.is_action_just_pressed("left"):
		change_column()
	elif Input.is_action_just_pressed("right"):
		change_column()
	
	if Input.is_action_just_pressed("confirm"):
		Events.emit_signal("battle_spell_selected", get_child(selected_spell_index))
	elif Input.is_action_just_pressed("cancel"):
		get_child(selected_spell_index).set_deselected()
		Events.emit_signal("battle_submenu_cancelled")
	elif Input.is_action_just_pressed("select"):
		get_child(selected_spell_index).set_deselected()
		Events.emit_signal("battle_member_changed")


func add_spell_to_list(spell_data) -> void:
	var spell = spell_scene.instance()
	add_child(spell)
	spell.set_data(spell_data)


func clear_list() -> void:
	for child in get_children():
		child.free()


func populate_list(member_data) -> void:
	selected_spell_index = 0
	current_column = 0
	clear_list()
	for spell in member_data[PlayerParty.SPELLS]:
		add_spell_to_list(spell)

	get_child(selected_spell_index).set_selected()


func select_previous_spell_in_column() -> void:
	var spell_amount = get_child_count()
	get_child(selected_spell_index).set_deselected()
	if selected_spell_index == 0:
		if spell_amount >= 2:
			if spell_amount % 2 == 0:
				selected_spell_index = spell_amount - 2
			else:
				selected_spell_index = spell_amount - 1
		else:
			selected_spell_index = 0
	elif selected_spell_index == 1:
		if spell_amount >= 4:
			if spell_amount % 2 == 0:
				selected_spell_index = spell_amount - 1
			else:
				selected_spell_index = spell_amount - 2
		else:
			selected_spell_index = 1
	else:
		selected_spell_index -= 2
		
	get_child(selected_spell_index).set_selected()
		
	
func select_next_spell_in_column() -> void:
	var spell_amount = get_child_count()
	get_child(selected_spell_index).set_deselected()
	if current_column == 0:
		if selected_spell_index + 2 > spell_amount - 1:
			selected_spell_index = 0
		elif selected_spell_index + 2 == spell_amount - 1:
			selected_spell_index = spell_amount - 1
		else:
			selected_spell_index += 2
	if current_column == 1:
		if selected_spell_index + 2 > spell_amount - 1:
			selected_spell_index = 1
		elif selected_spell_index + 2 == spell_amount - 1:
			selected_spell_index = spell_amount - 1
		else:
			selected_spell_index += 2
			
	get_child(selected_spell_index).set_selected()


func change_column() -> void:
	get_child(selected_spell_index).set_deselected()
	var spell_amount = get_child_count()
	
	if current_column == 0:
		if spell_amount >= selected_spell_index + 2:
			current_column = 1
			selected_spell_index += 1
	else:
		current_column = 0
		selected_spell_index -= 1
			
	get_child(selected_spell_index).set_selected()
	
	
