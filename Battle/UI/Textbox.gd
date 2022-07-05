extends NinePatchRect

onready var textbox_label: Label = $TextboxLabel


func _ready() -> void:
	textbox_label.text = ""
	visible = false


func set_text(text: String) -> void:
	textbox_label.text = text
	visible = true
	
	
func hide_textbox() -> void:
	textbox_label.text = ""
	visible = false
