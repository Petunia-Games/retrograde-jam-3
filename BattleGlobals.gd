extends Node

var player_party: Array = []
var enemy_party: Array = []

var enemy_stats_known = []

var active_party_member_index = 0
var previous_party_member_index = 0
var turn_number: int = 1
var turn_queue: Array = []


func clear() -> void:
	player_party.clear()
	enemy_party.clear()
	active_party_member_index = 0
	previous_party_member_index = 0
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


func add_action_to_turn_queue(from, to, action) -> void:
	var turn: Array = [from, to, action]
	turn_queue.append(turn)


func set_active_party_member() -> void:
	# This needs to be thought out some more
	previous_party_member_index = active_party_member_index
	active_party_member_index = (active_party_member_index + 1) % player_party.size()
	if player_party[active_party_member_index].is_dead:
		pass

func is_everyone_in_turn_queue() -> bool:
	for member in player_party:
		if not member.is_dead:
			if not member in turn_queue:
				return false
	for member in enemy_party:
		if not member.is_dead:
			if not member in turn_queue:
				return false
	return true
