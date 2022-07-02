extends Node

onready var ui: Control = $UI
onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
onready var anim: AnimationPlayer = $AnimationPlayer
onready var battle_timer: Timer = $BattleTimer

var player_party: Array = []
var enemy_party: Array = []

var battle_queue: Array = []
var ability_list: Array = []
var selected_member_index = 0
var selected_enemy_index = 0
var decision_phase = false
var action_phase = false

var tempo = 150.0
var timer = Timer.new()
var countdown_duration: float = 60000.0 / tempo / 1000.0


func _ready() -> void:
	# Add members to parties (this won't be done here, it's just for testing)
	PlayerParty.add_to_party(PlayerParty.char_1)
	#PlayerParty.add_to_party(PlayerParty.char_2)
	#PlayerParty.add_to_party(PlayerParty.char_3)
	
	player_party = PlayerParty.current_party
	
	#
	ui.add_party_members_to_list()
	ui.display_text("This is some placeholder text.")
	
	# Play music and set timer to correct ms value based on the tempo
	timer.connect("timeout", self, "_on_timer_timeout")
	battle_timer.connect("timeout", self, "_on_battle_timer_timeout")
	add_child(timer)
	battle_timer.start(0.5)
	
	ui.select_party_member(selected_member_index)
	
	
func _process(delta: float) -> void:
	get_input()


func get_input() -> void:
	# This is a shit way to do this, I need to be able to feed all of this to the UI
	# and let it deal with it
	if Input.is_action_just_pressed("up"):
		if decision_phase:
			match ui.current_window:
				ui.ABILITY:
					pass
				ui.SORCERY:
					pass
				
			ui.select_previous_ability()
	elif Input.is_action_just_pressed("down"):
		if decision_phase:
			ui.select_next_ability()
			
	if Input.is_action_just_pressed("confirm"):
		if decision_phase:
			pass
		if action_phase:
			if is_on_beat():
				print("ON BEAT")
			else:
				print("OFF BEAT")
	if Input.is_action_just_pressed("cancel"):
		if decision_phase:
			selected_member_index = (selected_member_index + 1) % player_party.size()
			ui.select_party_member(selected_member_index)
	


func is_on_beat() -> bool:
	var upper = countdown_duration * 0.1
	var lower = countdown_duration * 0.6
	var time_left = timer.time_left
	
	if time_left <= upper or time_left >= lower:
		return true
	return false


func _on_battle_timer_timeout() -> void:
	decision_phase = true
	timer.start(countdown_duration)
	#audio_player.play()


func _on_timer_timeout() -> void:
	pass
	#anim.play("FlashWhite")


func set_player_party() -> void:
	pass
	

func set_enemy_party() -> void:
	pass


func _on_AbilityNinePatch_ability_selected(ability_name) -> void:
	pass # Replace with function body.
