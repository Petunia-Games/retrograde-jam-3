extends Control

onready var pointer_anim: AnimationPlayer = $PointerAnimationPlayer
onready var member_anim: AnimationPlayer = $MemberAnimationPlayer

var member_name: String = ""
var member_id
var sprite
var is_dead = false

var level: int = 0
var exp_current: int = 0
var exp_next: int = 0
var hp_current: int = 0
var hp_max: int = 0
var strength: int = 0
var speed: int = 0
var sorcery: int = 0
var defense: int = 0

var abilities: Array = []
var spells: Array = []


func _ready() -> void:
	pointer_anim.play("Deselected")


func set_member_data_from_globals(_id) -> void:
	member_name = PlayerParty.id[str(_id)][PlayerParty.NAME]
	member_id = _id
	is_dead = PlayerParty.id[str(_id)][PlayerParty.IS_DEAD]
	
	level = PlayerParty.id[str(_id)][PlayerParty.LEVEL]
	exp_current = PlayerParty.id[str(_id)][PlayerParty.EXP_CURRENT]
	exp_next = PlayerParty.id[str(_id)][PlayerParty.EXP_NEXT]
	hp_current = PlayerParty.id[str(_id)][PlayerParty.HP_CURRENT]
	hp_max = PlayerParty.id[str(_id)][PlayerParty.HP_MAX]
	strength = PlayerParty.id[str(_id)][PlayerParty.STRENGTH]
	speed = PlayerParty.id[str(_id)][PlayerParty.SPEED]
	sorcery = PlayerParty.id[str(_id)][PlayerParty.SORCERY]
	defense = PlayerParty.id[str(_id)][PlayerParty.DEFENSE]
	
	abilities = PlayerParty.id[str(_id)][PlayerParty.ABILITIES]
	spells = PlayerParty.id[str(_id)][PlayerParty.SPELLS]


func set_selected() -> void:
	pointer_anim.play("Selected")
	
	
func set_deselected() -> void:
	pointer_anim.play("Deselected")
	
	
func modify_hp(amount, is_damage: bool = true) -> void:
	pass
