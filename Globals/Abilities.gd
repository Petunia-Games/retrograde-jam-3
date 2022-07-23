extends Node

enum {
	ATTACK,
	SORCERY,
	ITEM,
	ESCAPE,
	FIRE,
	THUNDER,
	ICE,
	WATER,
	POISON,
	SEER,
	CURSE,
	NOVA,
	DEVOUR,
	SUPERNOVA,
	POTION,
	AETHER,
	REVIVE,
	
}

enum SUBMENUS {
	NONE,
	SPELLS,
	ITEMS,
	TARGETS
}

enum ABILITY_TYPE {
	OFFENSIVE,
	DEFENSIVE
}

const ID = "id"
const NAME = "name"
const DESCRIPTION = "description"
const TYPE = "type"
const SUBMENU = "submenu"


var id = {
	str(ATTACK):{
		ID:ATTACK,
		NAME:"Attack",
		DESCRIPTION:"You attack...",
		TYPE:ABILITY_TYPE.OFFENSIVE,
		SUBMENU:SUBMENUS.TARGETS
	},
	str(SORCERY):{
		ID:SORCERY,
		NAME:"Sorcery",
		DESCRIPTION:"Use spells.",
		TYPE:ABILITY_TYPE.OFFENSIVE,
		SUBMENU:SUBMENUS.SPELLS
	},
	str(ITEM):{
		ID:ITEM,
		NAME:"Item",
		DESCRIPTION:"Use an item.",
		TYPE:ABILITY_TYPE.DEFENSIVE,
		SUBMENU:SUBMENUS.ITEMS
	},
	str(ESCAPE):{
		ID:ESCAPE,
		NAME:"Escape",
		DESCRIPTION:"Attempt to escape from battle.",
		TYPE:ABILITY_TYPE.DEFENSIVE,
		SUBMENU:SUBMENUS.NONE
	},
}
	

func pick_valid_target(from, target):
	if target.is_dead:
		for t in from.targets:
			if not t.is_dead:
				return t
	return target


func do_action(action):
	yield(get_tree(), "idle_frame")
	
	var from = action[BattleGlobals.FROM]
	var target = action[BattleGlobals.TO]
	
	match action[BattleGlobals.ACTION]:
		ATTACK:
			target = pick_valid_target(from, target)
			# Calculate random damage based on attacker str and opponent def
			# attack*(100/(100+defense)) ?
			var attack = from.strength
			var defense = target.defense
			var damage = attack * (1000/(100+defense))
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.ABILITY_ATTACK)]), "finished")
			target.modify_hp(damage, true)
		ESCAPE:
			# Check if encounter is escapable (store that in the enc id?)
			# If so:
			#		Loop through enemies and get the highest "escape difficulty" value
			#		Generate a random number between 0 and 255
			#		If it is above the "escape difficulty", emit escape signal
			if BattleGlobals.can_escape:
				var rand = randi() % 256
				if rand > BattleGlobals.get_escape_difficulty():
					Events.emit_signal("battle_escaped")
		FIRE:
			target = pick_valid_target(from, target)
			var attack = from.sorcery
			var defense = target.defense
			var damage = attack * (1000/(100+defense))
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.SPELL_FIRE_START)]), "finished")
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.SPELL_FIRE_END)]), "finished")
			target.modify_hp(damage, true)
		THUNDER:
			target = pick_valid_target(from, target)
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.SPELL_THUNDER_START)]), "finished")
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.SPELL_THUNDER_END)]), "finished")
		ICE:
			target = pick_valid_target(from, target)
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.SPELL_ICE_START)]), "finished")
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.SPELL_ICE_END)]), "finished")
		WATER:
			target = pick_valid_target(from, target)
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.SPELL_WATER_START)]), "finished")
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.SPELL_WATER_END)]), "finished")
		POISON:
			target = pick_valid_target(from, target)
		SEER:
			target = pick_valid_target(from, target)
			# Check if enemy is in list of discovered enemies
			# If not:
			#		Add them to the list and update the hp (random chance to succeed?)
			if not target.member_id in BattleGlobals.enemy_stats_known:
				BattleGlobals.enemy_stats_known.append(target.member_id)
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.SPELL_SEER)]), "finished")
		CURSE:
			target = pick_valid_target(from, target)
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.SPELL_CURSE_START)]), "finished")
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.SPELL_CURSE_END)]), "finished")
		NOVA:
			target = pick_valid_target(from, target)
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.SPELL_NOVA_START)]), "finished")
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.SPELL_NOVA_END)]), "finished")
		DEVOUR:
			target = pick_valid_target(from, target)
		SUPERNOVA:
			target = pick_valid_target(from, target)
		POTION:
			target = pick_valid_target(from, target)
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.ITEM_USE)]), "finished")
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.ITEM_POTION)]), "finished")
			target.modify_hp(100, false)
		AETHER:
			target = pick_valid_target(from, target)
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.ITEM_USE)]), "finished")
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.ITEM_AETHER)]), "finished")
		REVIVE:
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.ITEM_USE)]), "finished")
			yield(Audio.audio_player.play_sfx(Audio.id[str(Audio.ITEM_REVIVE)]), "finished")
