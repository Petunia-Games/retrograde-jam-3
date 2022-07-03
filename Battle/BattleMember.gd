class_name BattleMember
extends Control

export(String) var member_name: String = ""
export(Texture) var sprite
export(bool) var is_enemy = false
export(bool) var stats_known = false

export(int) var level: int = 0
export(int) var experience: int = 0
export(int) var current_hp: int = 0
export(int) var max_hp: int = 0
export(int) var strength: int = 0
export(int) var speed: int = 0
export(int) var sorcery: int = 0
export(int) var defense: int = 0
