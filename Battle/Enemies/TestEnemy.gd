extends BattleMember

onready var sprite_node: TextureRect = $TextureRect

var shown_current_hp = "????"
var shown_max_hp = "????"

func _ready() -> void:
	sprite_node.texture = sprite
	
	if is_enemy and member_id in BattleGlobals.enemy_stats_known:
		stats_known = true
