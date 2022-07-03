extends HBoxContainer

onready var ability_list: NinePatchRect = $AbilityList
onready var ability_submenu: NinePatchRect = $SubMenu

var party_list = preload("res://Battle/UI/PlayerPartyList.tscn").instance()
var sorcery_list = preload("res://Battle/UI/SorceryList.tscn").instance()
var item_list = preload("res://Battle/UI/ItemList.tscn").instance()
var target_list = preload("res://Battle/UI/TargetList.tscn").instance()

var active_menu
var previous_menu


func _process(delta: float) -> void:
	if active_menu != null:
		active_menu.process_input()


func set_active_menu(menu, member) -> void:
	active_menu = menu
	active_menu.populate_list(member)
