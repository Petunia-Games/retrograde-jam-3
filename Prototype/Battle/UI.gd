extends Control

enum {
	ABILITY,
	SORCERY,
	ITEM,
	TARGET
}

onready var textbox: NinePatchRect = $Textbox
onready var player_party_info: NinePatchRect = $PlayerPartyInfo
onready var ability_list: NinePatchRect = $AbilityNinePatch

var current_window

func add_party_members_to_list() -> void:
	for member in PlayerParty.current_party:
		player_party_info.add_party_member(member)
	
	
func select_party_member(member_index) -> void:
	player_party_info.set_selected_party_member(member_index)
	ability_list.set_ability_list(member_index)
	
	
func select_next_ability() -> void:
	ability_list.select_next_ability()
	
	
func select_previous_ability() -> void:
	ability_list.select_previous_ability()
	
	
func update_party_member_info(value) -> void:
	pass
	
	
func display_text(text) -> void:
	textbox.draw(text)
