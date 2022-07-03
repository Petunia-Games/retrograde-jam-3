extends Node

enum {
	DECISION_PHASE,
	ACTION_PHASE
}


var current_phase


func _ready() -> void:
	Events.connect("battle_started", self, "_on_battle_started")


func set_enemies_from_encounter_id(enc_id) -> Array:
	return []



func _on_battle_started() -> void:
	set_enemies_from_encounter_id(Globals.encounter_id)
	current_phase = DECISION_PHASE
	Events.emit_signal("battle_decision_phase_started")
