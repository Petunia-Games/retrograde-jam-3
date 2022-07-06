# ItemList.gd
extends GridContainer

var item_scene = preload("res://Battle/UI/Item.tscn")
var selected_item_index = 0
var current_column = 0


func process_input() -> void:
	if Input.is_action_just_pressed("up"):
		select_previous_item_in_column()
	elif Input.is_action_just_pressed("down"):
		select_next_item_in_column()
	elif Input.is_action_just_pressed("left"):
		change_column()
	elif Input.is_action_just_pressed("right"):
		change_column()
	
	if Input.is_action_just_pressed("confirm"):
		Events.emit_signal("battle_item_selected", get_child(selected_item_index))
	elif Input.is_action_just_pressed("cancel"):
		get_child(selected_item_index).set_deselected()
		Events.emit_signal("battle_submenu_cancelled")
	elif Input.is_action_just_pressed("select"):
		get_child(selected_item_index).set_deselected()
		Events.emit_signal("battle_member_changed")


func add_item_to_list(item_data) -> void:
	var item = item_scene.instance()
	add_child(item)
	item.set_data(item_data)


func populate_list(item_data: Dictionary) -> void:
	selected_item_index = 0
	current_column = 0
	clear_list()
	for item in item_data:
		var new_data = {str(item):PlayerParty.items[item]}
		add_item_to_list(new_data)

	get_child(selected_item_index).set_selected()


func clear_list() -> void:
	for child in get_children():
		child.free()


func select_previous_item_in_column() -> void:
	var item_count = get_child_count()
	get_child(selected_item_index).set_deselected()
	if selected_item_index == 0:
		if item_count >= 2:
			if item_count % 2 == 0:
				selected_item_index = item_count - 2
			else:
				selected_item_index = item_count - 1
		else:
			selected_item_index = 0
	elif selected_item_index == 1:
		if item_count >= 4:
			if item_count % 2 == 0:
				selected_item_index = item_count - 1
			else:
				selected_item_index = item_count - 2
		else:
			selected_item_index = 1
	else:
		selected_item_index -= 2
		
	get_child(selected_item_index).set_selected()
		
	
func select_next_item_in_column() -> void:
	var item_count = get_child_count()
	get_child(selected_item_index).set_deselected()
	if current_column == 0:
		if selected_item_index + 2 > item_count - 1:
			selected_item_index = 0
		elif selected_item_index + 2 == item_count - 1:
			selected_item_index = item_count - 1
		else:
			selected_item_index += 2
	if current_column == 1:
		if selected_item_index + 2 > item_count - 1:
			selected_item_index = 1
		elif selected_item_index + 2 == item_count - 1:
			selected_item_index = item_count - 1
		else:
			selected_item_index += 2
			
	get_child(selected_item_index).set_selected()


func change_column() -> void:
	get_child(selected_item_index).set_deselected()
	var item_count = get_child_count()
	
	if current_column == 0:
		if item_count >= selected_item_index + 2:
			current_column = 1
			selected_item_index += 1
	else:
		current_column = 0
		selected_item_index -= 1
			
	get_child(selected_item_index).set_selected()
