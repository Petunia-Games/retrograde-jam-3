extends GridContainer

var item_scene = preload("res://Battle/UI/Item.tscn")
var selected_item_index = 0

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
		pass
	elif Input.is_action_just_pressed("cancel"):
		Events.emit_signal("battle_submenu_cancelled")
	elif Input.is_action_just_pressed("select"):
		BattleGlobals.set_active_party_member()
		Events.emit_signal("battle_member_changed")


func add_item_to_list(item_data) -> void:
	var item = item_scene.instance()
	add_child(item)
	item.set_data(item_data)


func populate_list(item_data: Dictionary) -> void:
	clear_list()
	for item in item_data:
		var new_data = {str(item):PlayerParty.items[item]}
		add_item_to_list(new_data)

	get_child(selected_item_index).set_selected()

func clear_list() -> void:
	for child in get_children():
		child.free()
