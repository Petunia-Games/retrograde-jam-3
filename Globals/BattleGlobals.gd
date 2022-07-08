# Globals/BattleGlobals.gd
extends Node

const FROM = "from"
const TO = "to"
const ACTION = "action"

var can_escape: bool = true

var player_party: Array = []
var enemy_party: Array = []
var active_player_party_members: Array = []

var enemy_stats_known = []

var active_party_member_index = null
var previous_party_member_index = null
var turn_number: int = 1
var turn_queue: Array = []


func clear() -> void:
	player_party.clear()
	enemy_party.clear()
	active_player_party_members.clear()
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
	if from.type == "Player":
		var turn: Dictionary = {FROM:from, TO:to, ACTION:action}
		turn_queue.append(turn)
		active_player_party_members.erase(from)
		from.set_deselected()
		if not active_player_party_members.empty():
			active_party_member_index = (active_party_member_index + 1) % active_player_party_members.size()
	elif from.type == "Enemy":
		var turn: Dictionary = {FROM:from, TO:to, ACTION:action}
		turn_queue.append(turn)


func set_next_active_party_member() -> void:
	# This needs to be thought out some more
	if active_party_member_index == null:
		active_party_member_index = 0
		active_player_party_members[active_party_member_index].set_selected()
	else:
		previous_party_member_index = active_party_member_index
		active_player_party_members[active_party_member_index].set_deselected()
		
		# Increment member index
		active_party_member_index = (active_party_member_index + 1) % active_player_party_members.size()
		active_player_party_members[active_party_member_index].set_selected()


func is_everyone_in_turn_queue() -> bool:
	# TODO: Check for enemies too?
	if not active_player_party_members.empty():
		return false
	return true


func get_escape_difficulty() -> int:
	return 0
