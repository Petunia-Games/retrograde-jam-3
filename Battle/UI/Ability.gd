extends HBoxContainer

onready var pointer: TextureRect = $Pointer
onready var ability_label: Label = $AbilityLabel

var ability_name = ""
var ability_description = ""
var ability_submenu

func set_data(ability_data) -> void:
	pass
	
	
func set_selected() -> void:
	pointer.visible = true
	
	
func set_deselected() -> void:
	pointer.visible = false
