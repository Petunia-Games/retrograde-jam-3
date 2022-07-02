extends HBoxContainer

onready var pointer: TextureRect = $PointerTexture
onready var ability_name: Label = $AbilityLabel

func set_ability_name(_name) -> void:
	ability_name.text = _name
	
	
func set_selected() -> void:
	pointer.visible = true
	
	
func set_deselected() -> void:
	pointer.visible = false
