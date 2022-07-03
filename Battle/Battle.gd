extends Node

onready var ui: VBoxContainer = $UI


func _ready() -> void:
	Events.emit_signal("battle_started")
	ui.set_submenu(ui.party_list)
