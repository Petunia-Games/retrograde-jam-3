extends Control

const UP = "up"
const DOWN = "down"
const LEFT = "left"
const RIGHT = "right"
const CONFIRM = "confirm"
const CANCEL = "cancel"
const SELECT = "select"
const NONE = "none"

const ABILITY = "Ability"
const ATTACK = "Attack"
const SORCERY = "Sorcery"
const ITEM = "Item"
const ESCAPE = "Escape"
const TARGET = "Target"

onready var textbox: NinePatchRect = $Textbox
onready var player_party_info: NinePatchRect = $PlayerPartyInfo
onready var ability_list: NinePatchRect = $AbilityList
onready var sorcery_list: NinePatchRect = $SorceryList
#onready var item_list: NinePatchRect = $ItemList
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
					var selected_ability = PlayerParty.current_party[selected_party_member_index][PlayerParty.ABILITIES][ability_list.selected_ability_index]
					set_current_window(selected_ability)
				SELECT:
					selected_party_member_index = (selected_party_member_index + 1) % PlayerParty.current_party.size()
					select_party_member(selected_party_member_index)
		SORCERY:
			match get_input():
				CANCEL:
					hide_current_window()
				SELECT:
					selected_party_member_index = (selected_party_member_index + 1) % PlayerParty.current_party.size()
					select_party_member(selected_party_member_index)
		ITEM:
			pass
		TARGET:
			var current_type = target_list.ENEMY
			match get_input():
				UP:
					target_list.select_previous_target()
				DOWN:
					target_list.select_next_target()
				LEFT, RIGHT:
					if current_type == target_list.ENEMY:
						current_type = target_list.PLAYER
					elif current_type == target_list.PLAYER:
						current_type = target_list.ENEMY
					target_list.change_target_type(current_type)
				CONFIRM:
					pass
				CANCEL:
					hide_current_window()
				SELECT:
					selected_party_member_index = (selected_party_member_index + 1) % PlayerParty.current_party.size()
					select_party_member(selected_party_member_index)
			
			
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
			

# Populates the window's list and then shows it
func set_current_window(window_name: String) -> void:
	if window_name == ATTACK:
		window_name = TARGET
	previous_windows.append(current_window)
	current_window = window_name
	
	match window_name:
		ABILITY:
			pass
		ATTACK:
			target_list.set_target_list()
			target_list.visible = true
		SORCERY:
			sorcery_list.set_sorcery_list(selected_party_member_index)
			sorcery_list.visible = true
	

func hide_current_window() -> void:
	match current_window:
		SORCERY:
			sorcery_list.visible = false
			
	current_window = previous_windows.pop_back()


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
