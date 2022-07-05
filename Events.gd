extends Node

# Global bus used to connect signals between nodes

signal battle_started(msg)
signal battle_finished(msg)

signal battle_decision_phase_started(msg)
signal battle_decision_phase_finished(msg)

signal battle_action_phase_started(msg)
signal battle_action_phase_finished(msg)

signal battle_submenu_added(msg)
signal battle_submenu_removed(msg)
signal battle_submenu_cancelled(msg)

signal battle_member_changed(msg)

signal battle_ability_selected(msg)
signal battle_spell_selected(msg)
signal battle_item_selected(msg)
signal battle_target_selected(msg)

signal battle_action_added(msg)

signal battle_won(msg)
signal battle_lost(msg)
