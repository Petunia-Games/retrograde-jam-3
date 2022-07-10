# Globals/Audio.gd
extends Node

var audio_player: Node = null

enum {
	UI_MOVE_CURSOR,
	UI_CONFIRM,
	UI_CANCEL,
	UI_SWITCH,
	
	ABILITY_ATTACK,
	
	ITEM_USE,
	ITEM_POTION,
	ITEM_AETHER,
	ITEM_REVIVE,
	
	SPELL_SEER,
}

var id = {
	str(UI_MOVE_CURSOR):"res://Audio/SFX/UI/UI_MOVE_CURSOR.wav",
	str(UI_SWITCH):"res://Audio/SFX/UI/UI_SWITCH.wav",
	
	str(ABILITY_ATTACK):"res://Audio/SFX/Abilities/ABILITY_ATTACK.wav",
	
	str(SPELL_SEER):"res://Audio/SFX/Spells/Seer/Start.wav",
}


func set_sfx(sfx: String) -> void:
	audio_player.set_sfx_player_stream(sfx)
	print("SFX set to %s" % sfx)
