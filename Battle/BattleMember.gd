extends Control

export(String) var member_name: String = ""
export(int) var member_id
export(Texture) var sprite
export(bool) var is_dead = false
export(bool) var stats_known = false

export(int) var level: int = 0
export(int) var experience: int = 0
export(int) var current_hp: int = 0
export(int) var max_hp: int = 0
export(int) var strength: int = 0
export(int) var speed: int = 0
export(int) var sorcery: int = 0
export(int) var defense: int = 0

export(Array) var abilities: Array = []


func set_member_data_from_globals(member_id) -> void:
	pass
