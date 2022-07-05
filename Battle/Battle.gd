extends Node

onready var battle_member_list: HBoxContainer = $BattleMembers


var battle_member_scene = preload("res://Battle/BattleMember.tscn")

enum {
	DECISION_PHASE,
	ACTION_PHASE
}


var current_phase


func _ready() -> void:
	BattleGlobals.clear()
	Events.connect("battle_started", self, "_on_battle_started")
	Events.connect("battle_action_added", self, "_on_battle_action_added")


func set_enemies_from_encounter_id(enc_id) -> void:
	for enemy_id in Encounters.id[str(enc_id)]:
		BattleGlobals.enemy_party.append(Enemies.enemy_list[str(enemy_id)])


func set_party_members() -> void:
	for member in Globals.current_party:
		var battle_member = battle_member_scene.instance()
		battle_member_list.add_player(battle_member)
		BattleGlobals.player_party.append(battle_member)
		battle_member.set_member_data_from_globals(member)
	
	BattleGlobals.set_active_party_member()


func _on_battle_started() -> void:
	set_enemies_from_encounter_id(Globals.encounter_id)
	set_party_members()
	current_phase = DECISION_PHASE
	Events.emit_signal("battle_decision_phase_started")


func _on_battle_action_added(action, from, to) -> void:
	BattleGlobals.add_action_to_turn_queue(action, from, to)
