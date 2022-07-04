extends HBoxContainer

onready var pointer: TextureRect = $Pointer
onready var name_label: Label = $ItemNameLabel
onready var quantity_label: Label = $QuantityLabel


func _ready() -> void:
	pointer.self_modulate.a = 0.0


func set_data(item_data) -> void:
	pass
	
	
func set_selected() -> void:
	pointer.self_modulate.a = 1.0
	
	
func set_deselected() -> void:
	pointer.self_modulate.a = 0.0
