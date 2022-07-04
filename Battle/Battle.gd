extends Node

var battle_member_scene = preload("res://Battle/BattleMember.tscn")

enum {
	DECISION_PHASE,
	ACTION_PHASE
}


var current_phase


func _ready() -> void:
	Events.connect("battle_started", self, "_on_battle_started")


func set_enemies_from_encounter_id(enc_id) -> void:
	for enemy_id in Encounters.id[str(enc_id)]:
		BattleGlobals.enemy_party.append(Enemies.enemy_list[str(enemy_id)])


func set_party_members() -> void:
	for member in Globals.current_party:
		BattleGlobals.player_party.append(member)


func _on_battle_started() -> void:
	set_enemies_from_encounter_id(Globals.encounter_id)
	set_party_members()
	current_phase = DECISION_PHASE
	Events.emit_signal("battle_decision_phase_started")
