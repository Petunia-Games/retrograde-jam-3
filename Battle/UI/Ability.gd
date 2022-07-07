# Battle/UI/Ability.gd
extends HBoxContainer

onready var pointer: TextureRect = $Pointer
onready var ability_label: Label = $AbilityLabel

var ability_name = ""
var description = ""
var type = ""
var submenu


func set_data(ability_data) -> void:
	ability_name = ability_data[Abilities.NAME]
	description = ability_data[Abilities.DESCRIPTION]
	type = ability_data[Abilities.TYPE]
	submenu = ability_data[Abilities.SUBMENU]
	
	ability_label.text = ability_name
	
	
func set_selected() -> void:
	pointer.visible = true
	
	
func set_deselected() -> void:
	pointer.visible = false
