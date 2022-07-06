extends HBoxContainer

onready var pointer: TextureRect = $Pointer
onready var name_label: Label = $ItemNameLabel
onready var quantity_label: Label = $QuantityLabel

var item_name: String = ""
var quantity: String = ""
var description: String = ""
var type: int


func _ready() -> void:
	pointer.self_modulate.a = 0.0


func set_data(item_data: Dictionary) -> void:
	var item_id = item_data.keys()
	item_name = Items.id[item_id[0]][Items.NAME]
	quantity = str(item_data[item_id[0]][PlayerParty.ITEM_QUANTITY])
	description = Items.id[item_id[0]][Items.DESCRIPTION]
	type = Items.id[item_id[0]][Items.TYPE]
	
	name_label.text = item_name
	quantity_label.text = quantity
	
	
func set_selected() -> void:
	pointer.self_modulate.a = 1.0
	Events.emit_signal("battle_submenu_item_changed", self)
	
	
func set_deselected() -> void:
	pointer.self_modulate.a = 0.0
