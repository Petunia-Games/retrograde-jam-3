extends Node

var player_party: Array = []
var enemy_party: Array = []

var enemy_stats_known = []

var active_party_member_index = 0
var previous_party_member_index = 0
var turn_number: int = 1
var turn_queue: Array = []

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
	previous_party_member_index = active_party_member_index
	active_party_member_index = (active_party_member_index + 1) % player_party.size()
