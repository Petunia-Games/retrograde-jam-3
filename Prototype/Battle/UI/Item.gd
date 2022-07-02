extends HBoxContainer

onready var pointer: TextureRect = $PointerTexture
onready var item_name: Label = $ItemLabel

func set_ability_name(_name) -> void:
	item_name.text = _name
	
	
func set_selected() -> void:
	pointer.visible = true
	
	
func set_deselected() -> void:
	pointer.visible = false
