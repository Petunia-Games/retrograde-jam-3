extends ColorRect

onready var name_label: Label = $HBoxContainer/NameLabel
onready var hp_current_label: Label = $HBoxContainer/HPCurrentLabel
onready var hp_max_label: Label = $HBoxContainer/HPMaxLabel
onready var anim: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	anim.play("Default")


func set_data(member_data):
	name_label.text = member_data.member_name
	hp_current_label.text = str(member_data.hp_current)
	hp_max_label.text = str(member_data.hp_max)


func set_selected() -> void:
	anim.play("Pulse")
	
	
func set_deselected() -> void:
	anim.play("Default")
