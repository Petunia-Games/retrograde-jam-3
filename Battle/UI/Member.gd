extends ColorRect

onready var name_label: Label = $HBoxContainer/NameLabel
onready var hp_current_label: Label = $HBoxContainer/HPCurrentLabel
onready var hp_max_label: Label = $HBoxContainer/HPMaxLabel
onready var anim: AnimationPlayer = $AnimationPlayer


var member_name: String = ""
var hp_current: String = ""
var hp_max: String = ""


func _ready() -> void:
	anim.play("Default")


func set_data(member_data):
	member_name = member_data.member_name
	hp_current = str(member_data.hp_current)
	hp_max = str(member_data.hp_max)

	name_label.text = member_name
	hp_current_label.text = hp_current
	hp_max_label.text = hp_max


func set_selected() -> void:
	anim.play("Pulse")
	
	
func set_deselected() -> void:
	anim.play("Default")
