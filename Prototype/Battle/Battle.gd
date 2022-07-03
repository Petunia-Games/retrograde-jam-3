extends Node

onready var ui: Control = $UI
onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
onready var anim: AnimationPlayer = $AnimationPlayer
onready var battle_timer: Timer = $BattleTimer


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
	PlayerParty.add_to_party(PlayerParty.char_2)
	PlayerParty.add_to_party(PlayerParty.char_3)
	
	for member in PlayerParty.current_party:
		BattleGlobals.add_player_member(member)
		
	BattleGlobals.add_enemy_member(Enemies.enemies["0"])
	
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
	if decision_phase:
		ui.process_input()

	

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


