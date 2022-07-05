extends HBoxContainer

onready var pointer: TextureRect = $Pointer
onready var name_label: Label = $ItemNameLabel
onready var quantity_label: Label = $QuantityLabel


func _ready() -> void:
	pointer.self_modulate.a = 0.0


func set_data(item_data: Dictionary) -> void:
	var item_id = item_data.keys()
	name_label.text = Items.id[item_id[0]][Items.NAME]
	quantity_label.text = str(item_data[item_id[0]][PlayerParty.ITEM_QUANTITY])
	
	
func set_selected() -> void:
	pointer.self_modulate.a = 1.0
	
	
func set_deselected() -> void:
	pointer.self_modulate.a = 0.0
