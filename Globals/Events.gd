extends Node
# Global bus used to connect signals between nodes

# Battle
signal battle_started(msg)
signal battle_finished(msg)

signal battle_talk_phase_started(msg)
signal battle_talk_phase_finished(msg)

signal battle_decision_phase_started(msg)
signal battle_decision_phase_finished(msg)

signal battle_action_phase_started(msg)
signal battle_action_phase_finished(msg)

signal battle_submenu_added(msg)
signal battle_submenu_removed(msg)
signal battle_submenu_cancelled(msg)
signal battle_submenu_item_changed(msg)

signal battle_member_changed(msg)

signal battle_ability_selected(msg)
signal battle_spell_selected(msg)
signal battle_item_selected(msg)
signal battle_target_selected(msg)

signal battle_player_action_added(msg)
signal battle_enemy_action_added(msg)

signal battle_member_died(msg)
signal battle_member_revived(msg)

signal battle_won(msg)
signal battle_lost(msg)
signal battle_escaped(msg)


# Audio
signal audio_music_started(msg)
signal audio_music_finished(msg)

signal audio_sfx_started(msg)
signal audio_sfx_finished(msg)
