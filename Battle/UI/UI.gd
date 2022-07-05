extends VBoxContainer

onready var ability_menu: HBoxContainer = $AbilityMenu
onready var textbox: NinePatchRect = $Textbox


func _ready() -> void:
	# Connect signals
	Events.connect("battle_decision_phase_started", self, "_on_decision_phase_started")
	Events.connect("battle_member_changed", self, "_on_battle_member_changed")
	Events.connect("battle_submenu_item_changed", self, "_on_battle_submenu_item_changed")
	textbox.visible = false


func _on_decision_phase_started() -> void:
	ability_menu.set_active_menu(ability_menu.ability_list, BattleGlobals.player_party[BattleGlobals.active_party_member_index])
	ability_menu.change_party_member()

func _on_battle_member_changed() -> void:
	ability_menu.set_active_menu(ability_menu.ability_list, BattleGlobals.player_party[BattleGlobals.active_party_member_index])
	ability_menu.change_party_member()
	
func _on_battle_submenu_item_changed(submenu_item) -> void:
	textbox.set
