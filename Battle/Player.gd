extends BattleMember

onready var sprite_node: TextureRect = $TextureRect


func _ready() -> void:
	sprite_node.texture = sprite

	abilities.append()
