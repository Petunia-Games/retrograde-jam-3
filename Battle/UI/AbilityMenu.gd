extends HBoxContainer

onready var ability_list: NinePatchRect = $AbilityList
onready var ability_submenu: NinePatchRect = $SubMenu

var party_list = preload("res://Battle/UI/PlayerPartyList.tscn").instance()
var sorcery_list = preload("res://Battle/UI/SorceryList.tscn").instance()
var item_list = preload("res://Battle/UI/ItemList.tscn").instance()
var target_list = preload("res://Battle/UI/TargetList.tscn").instance()

var active_menu
var previous_menu


func _ready() -> void:
	Events.connect("battle_ability_selected", self, "_on_battle_ability_selected")



func _process(delta: float) -> void:
	if active_menu != null:
		active_menu.process_input()


# This function will cause issues
func set_active_menu(menu, member) -> void:
	previous_menu = active_menu
	active_menu = menu
	active_menu.populate_list(member)
	
	if active_menu == ability_list:
		if not party_list in ability_submenu.get_children():
			add_submenu(party_list)
		

func change_party_member() -> void:
	party_list.set_selected()
	
	
func add_submenu(submenu) -> void:
	ability_submenu.add_child(submenu)
	submenu.populate_list()


func remove_submenu(submenu) -> void:
	ability_submenu.remove_child(submenu)


func _on_battle_ability_selected(ability) -> void:
	pass
