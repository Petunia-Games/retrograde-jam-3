extends HBoxContainer

onready var name_label = $NameLabel
onready var hp_current  = $HPCurrentLabel
onready var hp_max = $HPMaxLabel


func set_info(value) -> void:
	name_label.text = value[PlayerParty.NAME]
	hp_current.text = str(value[PlayerParty.HP_CURRENT])
	hp_max.text = str(value[PlayerParty.HP_MAX])
