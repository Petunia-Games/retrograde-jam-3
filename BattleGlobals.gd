# Globals/BattleGlobals.gd
extends Node

const FROM = "from"
const TO = "to"
const ACTION = "action"

var player_party: Array = []
var enemy_party: Array = []

var enemy_stats_known = []

var active_party_member_index = null
var previous_party_member_index = null
var turn_number: int = 1
var turn_queue: Array = []


func clear() -> void:
	player_party.clear()
	enemy_party.clear()
	active_party_member_index = null
	previous_party_member_index = null
	turn_number = 1
	turn_queue.clear()


func add_player_member(member) -> void:
	player_party.append(member)
	
	
func add_enemy_member(member) -> void:
	enemy_party.append(member)


func remove_player_member(member_index) -> void:
	# TODO: Safety checks
	player_party.remove(member_index)
	
	
func remove_enemy_member(member_index) -> void:
	# TODO: Safety checks
	enemy_party.remove(member_index)


func add_action_to_turn_queue(action, from, to) -> void:
	var turn: Dictionary = {FROM:from, TO:to, ACTION:action}
	turn_queue.append(turn)


func set_active_party_member() -> void:
	# This needs to be thought out some more
	if active_party_member_index == null:
		for member in player_party.size():
			if not player_party[member].is_dead:
				active_party_member_index = member
				player_party[active_party_member_index].set_selected()
	else:
		previous_party_member_index = active_party_member_index
		player_party[previous_party_member_index].set_deselected()
		
		active_party_member_index = (active_party_member_index + 1) % player_party.size()
		if player_party[active_party_member_index].is_dead:
			set_active_party_member()
		else:
			for turn in turn_queue:
				if not player_party[active_party_member_index] == turn[FROM]:
					player_party[active_party_member_index].set_selected()
		


func is_everyone_in_turn_queue() -> bool:
	for member in player_party:
		if not member.is_dead:
			for turn in turn_queue:
				if not member in turn[FROM]:
					return false
	for member in enemy_party:
		if not member.is_dead:
			for turn in turn_queue:
				if not member in turn[FROM]:
					return false
	return true
