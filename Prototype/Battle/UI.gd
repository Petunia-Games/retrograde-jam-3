extends Control

const UP = "up"
const DOWN = "down"
const LEFT = "left"
const RIGHT = "right"
const CONFIRM = "confirm"
const CANCEL = "cancel"
const SELECT = "select"
const NONE = "none"

enum {
	ABILITY,
	SORCERY,
	ITEM,
	TARGET
}

onready var textbox: NinePatchRect = $Textbox
onready var player_party_info: NinePatchRect = $PlayerPartyInfo
onready var ability_list: NinePatchRect = $AbilityList
onready var sorcery_list: NinePatchRect = $SorceryList
onready var item_list: NinePatchRect = $ItemList
onready var target_list: NinePatchRect = $TargetList


var current_window = ABILITY
var previous_windows: Array = []
var selected_party_member_index = 0


func process_input() -> void:
	match current_window:
		ABILITY:
			match get_input():
				UP:
					ability_list.select_previous_ability()
				DOWN:
					ability_list.select_next_ability()
				CONFIRM:
					# Get whatever the ability list was on
					# Show relevant window
					var ability_selected = PlayerParty.current_party[selected_party_member_index][PlayerParty.ABILITIES][ability_list.selected_ability]
					print(ability_selected)
				SELECT:
					selected_party_member_index = (selected_party_member_index + 1) % PlayerParty.current_party.size()
					select_party_member(selected_party_member_index)
		SORCERY:
			pass
		ITEM:
			pass
		TARGET:
			pass
			
			
			
func get_input() -> String:
	# Check for pressed inputs
	if Input.is_action_just_pressed(UP):
		return UP
	elif Input.is_action_just_pressed(DOWN):
		return DOWN
	elif Input.is_action_just_pressed(LEFT):
		return LEFT
	elif Input.is_action_just_pressed(RIGHT):
		return RIGHT
	elif Input.is_action_just_pressed(CONFIRM):
		return CONFIRM
	elif Input.is_action_just_pressed(CANCEL):
		return CANCEL
	elif Input.is_action_just_pressed(SELECT):
		return SELECT
		
	return NONE
			
func set_current_window() -> void:
	pass
	




func add_party_members_to_list() -> void:
	for member in PlayerParty.current_party:
		player_party_info.add_party_member(member)
	
	
func select_party_member(member_index) -> void:
	player_party_info.set_selected_party_member(member_index)
	ability_list.set_ability_list(member_index)
	
	
	
func update_party_member_info(value) -> void:
	pass
	
	
func display_text(text) -> void:
	textbox.draw(text)
