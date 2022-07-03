extends NinePatchRect

onready var ability_list: VBoxContainer = $AbilityListVBox

var ability_scene = preload("res://Prototype/Battle/UI/Item.tscn")
var previously_selected_ability_index = 0
var selected_ability_index = 0

func set_ability_list(member_index) -> void:
	previously_selected_ability_index = 0
	selected_ability_index = 0
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
	ability_list.get_child(previously_selected_ability_index).set_deselected()
	selected_ability_index = (selected_ability_index + 1) % ability_list.get_child_count()
	ability_list.get_child(selected_ability_index).set_selected()
	previously_selected_ability_index = selected_ability_index

func select_previous_ability() -> void:
	ability_list.get_child(previously_selected_ability_index).set_deselected()
	if selected_ability_index == 0:
		selected_ability_index = ability_list.get_child_count() - 1
	else:
		selected_ability_index = selected_ability_index - 1
	ability_list.get_child(selected_ability_index).set_selected()
	previously_selected_ability_index = selected_ability_index
