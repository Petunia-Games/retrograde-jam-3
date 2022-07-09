# UI.gd
extends VBoxContainer

onready var ability_menu: HBoxContainer = $AbilityMenu
onready var textbox: NinePatchRect = $Textbox


func _ready() -> void:
	# Connect signals
	Events.connect("battle_decision_phase_started", self, "_on_decision_phase_started")
	Events.connect("battle_action_phase_started", self, "_on_battle_action_phase_started")
	Events.connect("battle_member_changed", self, "_on_battle_member_changed")
	Events.connect("battle_submenu_item_changed", self, "_on_battle_submenu_item_changed")
	Events.connect("battle_submenu_cancelled", self, "_on_battle_submenu_cancelled")
	textbox.visible = false


func _on_decision_phase_started() -> void:
	ability_menu.set_active_menu(ability_menu.ability_list, BattleGlobals.active_player_party_members[BattleGlobals.active_party_member_index])
	ability_menu.change_party_member()


func _on_battle_action_phase_started() -> void:
	ability_menu.remove_active_menu()


func _on_battle_member_changed() -> void:
	BattleGlobals.set_next_active_party_member()
	ability_menu.set_active_menu(ability_menu.ability_list, BattleGlobals.active_player_party_members[BattleGlobals.active_party_member_index])
	ability_menu.change_party_member()
	textbox.hide_textbox()
	
	
func _on_battle_submenu_item_changed(submenu_item) -> void:
	textbox.set_text(submenu_item.description)
	Events.emit_signal("audio_sfx_started", Audio.id[str(Audio.MOVE_CURSOR)])


func _on_battle_submenu_cancelled() -> void:
	textbox.visible = false
