# Battle/Battle.gd
extends Node

onready var battle_member_list: HBoxContainer = $BattleMembers


var player_member_scene = preload("res://Battle/BattleMember.tscn")
var enemy_member_scene = preload("res://Battle/EnemyMember.tscn")

enum {
	DECISION_PHASE,
	ACTION_PHASE
}


var current_phase


func _ready() -> void:
	BattleGlobals.clear()
	Events.connect("battle_started", self, "_on_battle_started")
	Events.connect("battle_decision_phase_started", self, "_on_battle_decision_phase_started")
	Events.connect("battle_decision_phase_finished", self, "_on_battle_decision_phase_finished")
	Events.connect("battle_action_phase_started", self, "_on_battle_action_phase_started")
	Events.connect("battle_player_action_added", self, "_on_battle_player_action_added")
	Events.connect("battle_enemy_action_added", self, "_on_battle_enemy_action_added")

func set_enemies_from_encounter_id(enc_id) -> void:
	for enemy_id in Encounters.id[str(enc_id)]:
		var enemy_member = enemy_member_scene.instance()
		battle_member_list.add_enemy(enemy_member)
		BattleGlobals.enemy_party.append(enemy_member)
		enemy_member.set_member_data_from_globals(enemy_id)
		

func set_party_members() -> void:
	for member in Globals.current_party:
		var battle_member = player_member_scene.instance()
		battle_member_list.add_player(battle_member)
		BattleGlobals.player_party.append(battle_member)
		battle_member.set_member_data_from_globals(member)
		if not battle_member.is_dead:
			BattleGlobals.active_player_party_members.append(battle_member)
	
	BattleGlobals.set_next_active_party_member()


func _on_battle_started() -> void:
	set_enemies_from_encounter_id(Globals.encounter_id)
	set_party_members()
	current_phase = DECISION_PHASE
	Events.emit_signal("battle_decision_phase_started")


func _on_battle_decision_phase_started() -> void:
	for enemy in BattleGlobals.enemy_party:
		enemy.decide_action()


func _on_battle_decision_phase_finished() -> void:
	Events.emit_signal("battle_action_phase_started")


func _on_battle_action_phase_started() -> void:
	pass


func _on_battle_player_action_added(action, from, to) -> void:
	BattleGlobals.add_action_to_turn_queue(action, from, to)
	
	if not BattleGlobals.is_everyone_in_turn_queue():
		Events.emit_signal("battle_member_changed")
	else:
		Events.emit_signal("battle_decision_phase_finished")


func _on_battle_enemy_action_added(action, from, to) -> void:
	BattleGlobals.add_action_to_turn_queue(action, from, to)
	
	if BattleGlobals.is_everyone_in_turn_queue():
		Events.emit_signal("battle_decision_phase_finished")
