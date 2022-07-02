extends NinePatchRect

onready var party_list: VBoxContainer = $PlayerParty

var member_scene = preload("res://Prototype/Battle/UI/PartyMember.tscn")
var previously_selected = 0

func add_party_member(member_info) -> void:
	var member = member_scene.instance()
	party_list.add_child(member)
	member.set_info(member_info)
	

func set_selected_party_member(member_index) -> void:
	party_list.get_child(previously_selected).set_deselected()
	party_list.get_child(member_index).set_selected()
	previously_selected = member_index


func set_party_member_info(value) -> void:
	pass
