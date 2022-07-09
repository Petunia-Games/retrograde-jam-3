extends Node

static func decide_action(from):
	var action
	var to
	action = Spells.id[str(Spells.DEVOUR)]
	to = BattleGlobals.active_player_party_members[0]
	
	Events.emit_signal("battle_enemy_action_added", action, from, to)
