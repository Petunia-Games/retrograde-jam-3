extends ColorRect

onready var name_label = $Info/NameLabel
onready var hp_current  = $Info/HPCurrentLabel
onready var hp_max = $Info/HPMaxLabel


func set_info(value) -> void:
	name_label.text = value[PlayerParty.NAME]
	hp_current.text = str(value[PlayerParty.HP_CURRENT])
	hp_max.text = str(value[PlayerParty.HP_MAX])


func set_selected() -> void:
	$AnimationPlayer.play("Pulse")
	

func set_deselected() -> void:
	$AnimationPlayer.play("Default")
