# Battle/EnemyMember.gd
extends Control

onready var pointer_anim: AnimationPlayer = $PointerAnimationPlayer
onready var member_anim: AnimationPlayer = $MemberAnimationPlayer

const UNDISCOVERED = "????"

var member_name: String = ""
var member_id
var sprite
var is_dead = false
var type = "Enemy"

var level: int = 0
var experience: int = 0
var escape_difficulty: int = 0
var hp_current: int = 0
var hp_max: int = 0
var strength: int = 0
var speed: int = 0
var sorcery: int = 0
var defense: int = 0

var items: Array = []

var ai_script

func _ready() -> void:
	pointer_anim.play("Deselected")


func set_member_data_from_globals(_id) -> void:
	member_name = Enemies.id[str(_id)][Enemies.NAME]
	member_id = _id
	
	level = Enemies.id[str(_id)][Enemies.LEVEL]
	experience = Enemies.id[str(_id)][Enemies.EXP]
	escape_difficulty = Enemies.id[str(_id)][Enemies.ESCAPE_DIFFICULTY]
	hp_current = Enemies.id[str(_id)][Enemies.HP]
	hp_max = Enemies.id[str(_id)][Enemies.HP]
	strength = Enemies.id[str(_id)][Enemies.STRENGTH]
	speed = Enemies.id[str(_id)][Enemies.SPEED]
	sorcery = Enemies.id[str(_id)][Enemies.SORCERY]
	defense = Enemies.id[str(_id)][Enemies.DEFENSE]
	
	items = Enemies.id[str(_id)][Enemies.ITEMS]
	
	ai_script = load(Enemies.id[str(_id)][Enemies.AI_SCRIPT])

	

func set_selected() -> void:
	pointer_anim.play("Selected")
	
	
func set_deselected() -> void:
	pointer_anim.play("Deselected")
	
	
func modify_hp(amount, is_damage: bool = true) -> void:
	if is_damage:
		hp_current -= amount
		if hp_current <= 0:
			Events.emit_signal("battle_member_died", self)


func decide_action() -> void:
	ai_script.decide_action(self)
