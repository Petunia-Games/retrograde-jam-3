extends NinePatchRect

onready var party_list: VBoxContainer = $PlayerParty

var member_scene = preload("res://Prototype/Battle/UI/PartyMember.tscn")

func add_party_member(member_info) -> void:
	var member = member_scene.instance()
	party_list.add_child(member)
	member.set_info(member_info)
	

func set_party_member_info(value) -> void:
	pass
