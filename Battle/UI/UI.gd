# UI.gd
extends VBoxContainer

var ability_menu_scene = preload("res://Battle/UI/AbilityMenu.tscn")
var beat_window_scene = preload("res://Battle/UI/BeatWindow.tscn")

onready var textbox: NinePatchRect = $Textbox

var ability_menu = null
var beat_window = null


func _ready() -> void:
	# Connect signals
	Events.connect("battle_member_changed", self, "_on_battle_member_changed")
	Events.connect("battle_submenu_item_changed", self, "_on_battle_submenu_item_changed")
	Events.connect("battle_submenu_cancelled", self, "_on_battle_submenu_cancelled")
	textbox.visible = false


func show_ability_menu() -> void:
	ability_menu = ability_menu_scene.instance()
	add_child(ability_menu)
	ability_menu.set_active_menu(ability_menu.ability_list, BattleGlobals.active_player_party_members[BattleGlobals.active_party_member_index])
	ability_menu.change_party_member()


func remove_ability_menu() -> void:
	ability_menu.remove_active_menu()
	ability_menu.queue_free()
	textbox.visible = false


func show_beat_window() -> void:
	beat_window = beat_window_scene.instance()
	add_child(beat_window)


func remove_beat_window() -> void:
	if beat_window != null:
		beat_window.queue_free()
	textbox.visible = false


func _on_battle_member_changed() -> void:
	BattleGlobals.set_next_active_party_member()
	ability_menu.set_active_menu(ability_menu.ability_list, BattleGlobals.active_player_party_members[BattleGlobals.active_party_member_index])
	ability_menu.change_party_member()
	textbox.hide_textbox()
	Audio.audio_player.play_sfx(Audio.id[str(Audio.UI_SWITCH)])
	
	
func _on_battle_submenu_item_changed(submenu_item) -> void:
	textbox.set_text(submenu_item.description)
	Audio.audio_player.play_sfx(Audio.id[str(Audio.UI_MOVE_CURSOR)])


func _on_battle_submenu_cancelled() -> void:
	textbox.visible = false
