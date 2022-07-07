extends Node

onready var music_player: AudioStreamPlayer = $Music
onready var sfx_player: AudioStreamPlayer = $SFX


func _ready() -> void:
	Events.connect("audio_music_started", self, "_on_audio_music_started")
	Events.connect("audio_sfx_started", self, "_on_audio_sfx_started")
	
	
func _on_audio_music_started(track_id) -> void:
	music_player.stream = load(track_id)
	music_player.play()
	
	
func _on_audio_sfx_started(track_id) -> void:
	sfx_player.stream = load(track_id)
	sfx_player.play()
