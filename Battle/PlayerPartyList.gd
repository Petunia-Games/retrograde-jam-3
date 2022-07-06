# PlayerPartyList.gd
extends VBoxContainer

var member_scene = preload("res://Battle/UI/Member.tscn")


func populate_list() -> void:
	clear_list()
	for member in BattleGlobals.player_party:
		var new_member = member_scene.instance()
		add_child(new_member)
		new_member.set_data(member)


func clear_list() -> void:
	for child in get_children():
		child.free()


func set_selected() -> void:
	set_deselected()
	get_child(BattleGlobals.active_party_member_index).set_selected()


func set_deselected() -> void:
	if BattleGlobals.previous_party_member_index == null:
		return
	get_child(BattleGlobals.previous_party_member_index).set_deselected()
