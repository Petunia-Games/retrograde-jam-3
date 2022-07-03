extends VBoxContainer

onready var ability_menu: HBoxContainer = $AbilityMenu
onready var textbox: NinePatchRect = $Textbox


func _ready() -> void:
	# Connect signals
	textbox.visible = false


func set_submenu(submenu) -> void:
	ability_menu.set_submenu(submenu)
