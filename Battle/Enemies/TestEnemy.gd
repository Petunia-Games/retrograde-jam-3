extends BattleMember

onready var sprite_node: TextureRect = $TextureRect

var shown_current_hp = "????"
var shown_max_hp = "????"


func _ready() -> void:
	Events.connect("battle_decision_phase_started", self, "decide_action")
	sprite_node.texture = sprite
	
	if member_id in BattleGlobals.enemy_stats_known:
		stats_known = true

	abilities.append(BattleGlobals.abilities[str(BattleGlobals.ABILITIES.ATTACK_LEVEL_1)])
	abilities.append(BattleGlobals.abilities[str(BattleGlobals.ABILITIES.DEVOUR)])


func modify_health(mod) -> void:
	if current_hp + mod <= 0:
		is_dead = true
	elif current_hp + mod > max_hp:
		current_hp = max_hp
		
	if stats_known:
		shown_current_hp = current_hp
		shown_max_hp = max_hp
	

func decide_action() -> void:
	var target = null
	var action = null
	if BattleGlobals.turn_number == 1:
		# Pick random opponent to attack
		target = randi() % BattleGlobals.player_party.size()
		action = abilities[0]
		
	BattleGlobals.add_action_to_turn_queue(self, target, action)
