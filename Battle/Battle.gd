# Battle/Battle.gd
extends Node

onready var battle_member_list: HBoxContainer = $BattleMembers
onready var ui: VBoxContainer = $UI

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
	Events.connect("battle_escaped", self, "_on_battle_escaped")
	Events.connect("battle_decision_phase_started", self, "_on_battle_decision_phase_started")
	Events.connect("battle_decision_phase_finished", self, "_on_battle_decision_phase_finished")
	Events.connect("battle_action_phase_started", self, "_on_battle_action_phase_started")
	Events.connect("battle_action_phase_finished",self, "_on_battle_action_phase_finished")
	Events.connect("battle_player_action_added", self, "_on_battle_player_action_added")
	Events.connect("battle_enemy_action_added", self, "_on_battle_enemy_action_added")
	Events.connect("battle_member_died", self, "_on_battle_member_died")

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


func _on_battle_started() -> void:
	set_party_members()
	set_enemies_from_encounter_id(Globals.encounter_id)
	Events.emit_signal("battle_decision_phase_started")


func _on_battle_escaped() -> void:
	print("Escaped from battle")


func _on_battle_decision_phase_started() -> void:
	for member in BattleGlobals.player_party:
		if not member.is_dead:
			BattleGlobals.active_player_party_members.append(member)
			
	BattleGlobals.set_next_active_party_member()
	
	for enemy in BattleGlobals.enemy_party:
		enemy.decide_action()
		
	ui.show_ability_menu()
	

func _on_battle_decision_phase_finished() -> void:
	BattleGlobals.active_party_member_index = null
	ui.remove_ability_menu()
	
	Events.emit_signal("battle_action_phase_started")


func _on_battle_action_phase_started() -> void:
	ui.show_beat_window()
	for turn in BattleGlobals.turn_queue:
		yield(Abilities.do_action(turn), "completed")

	Events.emit_signal("battle_action_phase_finished")


func _on_battle_action_phase_finished() -> void:
	BattleGlobals.turn_number += 1
	ui.remove_beat_window()
	BattleGlobals.turn_queue.clear()
	
	Events.emit_signal("battle_decision_phase_started")
	

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


func _on_battle_member_died(member) -> void:
	if member.type == "Enemy":
		queue_free()
