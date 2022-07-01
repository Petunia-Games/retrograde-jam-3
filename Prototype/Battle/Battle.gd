extends Node

onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
onready var anim: AnimationPlayer = $AnimationPlayer
onready var battle_timer: Timer = $BattleTimer

var player_party: Array = []
var enemy_party: Array = []

var battle_queue: Array = []
var decision_phase = false
var action_phase = false

var tempo = 150.0
var timer = Timer.new()
var countdown_duration: float = 60000.0 / tempo / 1000.0


func _ready() -> void:
	# Play music and set timer to correct ms value based on the tempo
	timer.connect("timeout", self, "_on_timer_timeout")
	battle_timer.connect("timeout", self, "_on_battle_timer_timeout")
	add_child(timer)
	battle_timer.start(2)
	
	
func _process(delta: float) -> void:
	get_input()


func get_input() -> void:
	if Input.is_action_just_pressed("confirm"):
		if action_phase:
			if is_on_beat():
				print("ON BEAT")
			else:
				print("OFF BEAT")


func is_on_beat() -> bool:
	var upper = countdown_duration * 0.1
	var lower = countdown_duration * 0.6
	var time_left = timer.time_left
	
	if time_left <= upper or time_left >= lower:
		return true
	return false


func _on_battle_timer_timeout() -> void:
	action_phase = true
	timer.start(countdown_duration)
	audio_player.play()


func _on_timer_timeout() -> void:
	pass
	#anim.play("FlashWhite")


func set_player_party() -> void:
	pass
	

func set_enemy_party() -> void:
	pass
