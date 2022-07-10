extends Node

onready var music_player: AudioStreamPlayer = $Music
onready var sfx_player: AudioStreamPlayer = $SFX


func _ready() -> void:
	Audio.audio_player = self
	
	
func play_sfx(sfx_id) -> AudioStreamPlayer:
	sfx_player.stream = load(sfx_id)
	sfx_player.play()
	return sfx_player
	
	
func set_music_player_stream(track_id) -> void:
	music_player.stream = load(track_id)
	music_player.play()
