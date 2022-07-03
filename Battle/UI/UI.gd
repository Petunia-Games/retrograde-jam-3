extends VBoxContainer

onready var ability_menu: HBoxContainer = $AbilityMenu
onready var textbox: NinePatchRect = $Textbox


func _ready() -> void:
	# Connect signals
	Events.connect("battle_decision_phase_started", self, "_on_decision_phase_started")
	textbox.visible = false



func _on_decision_phase_started() -> void:
	ability_menu.set_active_menu(ability_menu.ability_list, BattleGlobals.player_party.front())
