extends HBoxContainer

onready var pointer: TextureRect = $Pointer
onready var spell_name_label: Label = $SpellNameLabel
onready var spell_uses_remaining: Label = $SpellUsesLabel
onready var spell_uses_max: Label = $SpellMaxUsesLabel


func _ready() -> void:
	pointer.self_modulate.a = 0.0

func set_data(spell_data: Dictionary) -> void:
	var spell_id = spell_data.keys()
	spell_name_label.text = Spells.id[spell_id[0]][Spells.NAME]
	spell_uses_remaining.text = str(spell_data[spell_id[0]][PlayerParty.SPELL_POINTS_CURRENT])
	spell_uses_max.text = str(spell_data[spell_id[0]][PlayerParty.SPELL_POINTS_MAX])


func set_selected() -> void:
	pointer.self_modulate.a = 1.0
	
	
func set_deselected() -> void:
	pointer.self_modulate.a = 0.0
