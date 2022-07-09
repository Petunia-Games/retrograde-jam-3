extends HBoxContainer

onready var pointer: TextureRect = $Pointer
onready var name_label: Label = $TargetNameLabel
onready var hp_current_label: Label = $TargetHPCurrentLabel
onready var hp_max_label: Label = $TargetHPMaxLabel

var target_ref = null
var target_name: String = ""
var target_hp_current: String = ""
var target_hp_max: String = ""


func set_data(target_data) -> void:
	target_ref = target_data
	target_name = target_data.member_name
	target_hp_current = str(target_data.hp_current)
	target_hp_max = str(target_data.hp_max)

	name_label.text = target_name
	hp_current_label.text = target_hp_current
	hp_max_label.text = target_hp_max
	

func set_selected() -> void:
	pass
	
	
func set_deselected() -> void:
	pass
