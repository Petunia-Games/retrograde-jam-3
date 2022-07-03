extends NinePatchRect

signal ability_selected(ability_name)

onready var ability_list: VBoxContainer = $AbilityList

var ability_scene = preload("res://Prototype/Battle/UI/Item.tscn")
var previously_selected_ability = 0
var selected_ability = 0

func set_ability_list(member_index) -> void:
	previously_selected_ability = 0
	selected_ability = 0
	clear_ability_list()
	for ability in PlayerParty.current_party[member_index][PlayerParty.ABILITIES]:
		var new_ability = ability_scene.instance()
		ability_list.add_child(new_ability)
		new_ability.set_ability_name(ability)
	
	ability_list.get_child(0).set_selected()


func clear_ability_list() -> void:
	for child in ability_list.get_children():
		ability_list.remove_child(child)


func select_next_ability() -> void:
	ability_list.get_child(previously_selected_ability).set_deselected()
	selected_ability = (selected_ability + 1) % ability_list.get_child_count()
	ability_list.get_child(selected_ability).set_selected()
	previously_selected_ability = selected_ability

func select_previous_ability() -> void:
	ability_list.get_child(previously_selected_ability).set_deselected()
	if selected_ability == 0:
		selected_ability = ability_list.get_child_count() - 1
	else:
		selected_ability = selected_ability - 1
	ability_list.get_child(selected_ability).set_selected()
	previously_selected_ability = selected_ability
