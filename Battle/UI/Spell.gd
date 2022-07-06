extends HBoxContainer

onready var pointer: TextureRect = $Pointer
onready var spell_name_label: Label = $SpellNameLabel
onready var spell_uses_remaining: Label = $UsesHBox/SpellUsesLabel
onready var spell_uses_max: Label = $UsesHBox/SpellMaxUsesLabel

var spell_name: String = ""
var description: String = ""
var type: int
var uses_remaining: String = ""
var uses_max: String = ""


func _ready() -> void:
	pointer.self_modulate.a = 0.0


func set_data(spell_data: Dictionary) -> void:
	var spell_id = spell_data.keys()
	spell_name = Spells.id[spell_id[0]][Spells.NAME]
	uses_remaining = str(spell_data[spell_id[0]][PlayerParty.SPELL_POINTS_CURRENT])
	uses_max = str(spell_data[spell_id[0]][PlayerParty.SPELL_POINTS_MAX])
	description = Spells.id[spell_id[0]][Spells.DESCRIPTION]
	type = Spells.id[spell_id[0]][Spells.TYPE]
	
	spell_name_label.text = spell_name
	spell_uses_remaining.text = uses_remaining
	spell_uses_max.text = uses_max


func set_selected() -> void:
	pointer.self_modulate.a = 1.0
	Events.emit_signal("battle_submenu_item_changed", self)
	
	
func set_deselected() -> void:
	pointer.self_modulate.a = 0.0
