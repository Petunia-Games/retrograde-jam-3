# Globals/Audio.gd
extends Node

enum {
	UI_MOVE_CURSOR,
	UI_CONFIRM,
	UI_CANCEL,
	UI_SWITCH,
	ITEM_USE,
	ITEM_POTION,
	ITEM_AETHER,
	ITEM_REVIVE,
	SPELL_SEER,
}

var id = {
	str(UI_MOVE_CURSOR):"res://Audio/SFX/UI/UI_MOVE_CURSOR.wav",
	str(UI_SWITCH):"res://Audio/SFX/UI/UI_SWITCH.wav",
	str(SPELL_SEER):"res://Audio/SFX/Spells/Seer/Start.wav",
}
