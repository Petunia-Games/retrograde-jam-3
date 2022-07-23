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
	
	SPELL_FIRE_START,
	SPELL_FIRE_END,
	SPELL_THUNDER_START,
	SPELL_THUNDER_END,
	SPELL_ICE_START,
	SPELL_ICE_END,
	SPELL_WATER_START,
	SPELL_WATER_END,
	SPELL_CURSE_START,
	SPELL_CURSE_END,
	SPELL_SEER,
	SPELL_NOVA_START,
	SPELL_NOVA_END,
}

var id = {
	str(UI_MOVE_CURSOR):"res://Audio/SFX/UI/UI_MOVE_CURSOR.wav",
	str(UI_SWITCH):"res://Audio/SFX/UI/UI_SWITCH.wav",
	
	str(ABILITY_ATTACK):"res://Audio/SFX/Abilities/ABILITY_ATTACK.wav",
	
	str(ITEM_USE):"res://Audio/SFX/Items/ITEM_USE.wav",
	str(ITEM_POTION):"res://Audio/SFX/Items/ITEM_POTION.wav",
	str(ITEM_AETHER):"res://Audio/SFX/Items/ITEM_AETHER.wav",
	str(ITEM_REVIVE):"res://Audio/SFX/Items/ITEM_REVIVE.wav",
	
	str(SPELL_FIRE_START):"res://Audio/SFX/Spells/Fire/Start.wav",
	str(SPELL_FIRE_END):"res://Audio/SFX/Spells/Fire/End.wav",
	str(SPELL_THUNDER_START):"res://Audio/SFX/Spells/Thunder/Start.wav",
	str(SPELL_THUNDER_END):"res://Audio/SFX/Spells/Thunder/End.wav",
	str(SPELL_ICE_START):"res://Audio/SFX/Spells/Ice/Start.wav",
	str(SPELL_ICE_END):"res://Audio/SFX/Spells/Ice/End.wav",
	str(SPELL_WATER_START):"res://Audio/SFX/Spells/Water/Start.wav",
	str(SPELL_WATER_END):"res://Audio/SFX/Spells/Water/End.wav",
	str(SPELL_CURSE_START):"res://Audio/SFX/Spells/Curse/Start.wav",
	str(SPELL_CURSE_END):"res://Audio/SFX/Spells/Curse/End.wav",
	str(SPELL_SEER):"res://Audio/SFX/Spells/Seer/Start.wav",
	str(SPELL_NOVA_START):"res://Audio/SFX/Spells/Nova/Start.wav",
	str(SPELL_NOVA_END):"res://Audio/SFX/Spells/Nova/End.wav",
}


func set_sfx(sfx: String) -> void:
	audio_player.set_sfx_player_stream(sfx)
	print("SFX set to %s" % sfx)
