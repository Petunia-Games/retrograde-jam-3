# AbilityMenu.gd
extends HBoxContainer

onready var ability_list: NinePatchRect = $AbilityList
onready var ability_submenu: NinePatchRect = $SubMenu

var party_list = preload("res://Battle/UI/PlayerPartyList.tscn").instance()
var sorcery_list = preload("res://Battle/UI/SorceryList.tscn").instance()
var item_list = preload("res://Battle/UI/ItemList.tscn").instance()
var target_list = preload("res://Battle/UI/TargetList.tscn").instance()

var active_menu
var previous_menus: Array = []

func _ready() -> void:
	previous_menus = []
	Events.connect("battle_ability_selected", self, "_on_battle_ability_selected")
	Events.connect("battle_spell_selected", self, "_on_battle_spell_selected")
	Events.connect("battle_item_selected", self, "_on_battle_item_selected")
	Events.connect("battle_target_selected", self, "_on_battle_target_selected")
	Events.connect("battle_submenu_cancelled", self, "_on_battle_submenu_cancelled")


func _process(delta: float) -> void:
	if active_menu != null and weakref(active_menu).get_ref():
		active_menu.process_input()


# This function will cause issues
func set_active_menu(menu, data) -> void:
	if active_menu != target_list:
		previous_menus.append(active_menu)
	active_menu = menu
	
	if active_menu == ability_list:
		previous_menus.clear()
		if not party_list in ability_submenu.get_children():
			hide_submenu()
			ability_submenu.add_child(party_list)
			party_list.populate_list()
			party_list.set_selected()
		else:
			hide_submenu()
			party_list.populate_list()
			party_list.set_selected()
			party_list.visible = true
	else:
		if not active_menu in ability_submenu.get_children():
			hide_submenu()
			ability_submenu.add_child(active_menu)
		else:
			hide_submenu()
			active_menu.visible = true
	
	active_menu.populate_list(data)


func remove_active_menu() -> void:
	active_menu.queue_free()


func change_party_member() -> void:
	party_list.set_selected()
	previous_menus.clear()


func hide_submenu() -> void:
	if ability_submenu.get_child_count() == 0:
		return
	else:
		for child in ability_submenu.get_children():
			child.visible = false


func _on_battle_submenu_cancelled() -> void:
	var previous_menu = previous_menus.pop_back()
	var data
	match previous_menu:
		ability_list:
			data = BattleGlobals.active_player_party_members[BattleGlobals.active_party_member_index]
		sorcery_list:
			data = BattleGlobals.active_player_party_members[BattleGlobals.active_party_member_index]
		item_list:
			data = PlayerParty.items

	set_active_menu(previous_menu, data)


func _on_battle_ability_selected(ability) -> void:
	match ability.submenu:
		Abilities.SUBMENUS.NONE:
			var action = ability
			var from = BattleGlobals.active_player_party_members[BattleGlobals.active_party_member_index]
			var to = from
			Events.emit_signal("battle_player_action_added", action, from, to)
		Abilities.SUBMENUS.SPELLS:
			set_active_menu(sorcery_list, BattleGlobals.active_player_party_members[BattleGlobals.active_party_member_index])
		Abilities.SUBMENUS.ITEMS:
			set_active_menu(item_list, PlayerParty.items)
		Abilities.SUBMENUS.TARGETS:
			set_active_menu(target_list, ability)


func _on_battle_spell_selected(spell) -> void:
	set_active_menu(target_list, spell)


func _on_battle_item_selected(item) -> void:
	set_active_menu(target_list, item)
	
	
func _on_battle_target_selected(action, from, to) -> void:
	Events.emit_signal("battle_player_action_added", action, from, to)
	previous_menus.clear()
