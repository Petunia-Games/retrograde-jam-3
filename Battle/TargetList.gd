# Battle/TargetList.gd
extends VBoxContainer


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
		Events.emit_signal("battle_member_changed")


func populate_list(target_data) -> void:
	pass
