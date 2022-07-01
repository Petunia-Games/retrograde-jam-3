extends Node

onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
onready var anim: AnimationPlayer = $AnimationPlayer
onready var battle_timer: Timer = $BattleTimer

var tempo = 120.0
var timer = Timer.new()
var countdown_duration: float = (60000.0 / tempo / 1000.0)


func _ready() -> void:
	# Play music and set timer to correct ms value based on the tempo
	timer.connect("timeout", self, "_on_timer_timeout")
	battle_timer.connect("timeout", self, "_on_battle_timer_timeout")
	add_child(timer)
	battle_timer.start(2)
	

func _on_battle_timer_timeout() -> void:
	timer.start(countdown_duration)
	audio_player.play()


func _on_timer_timeout() -> void:
	anim.play("FlashWhite")
