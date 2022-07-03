extends NinePatchRect

const ENEMY = "enemy"
const PLAYER = "player"

onready var enemy_target_list: VBoxContainer = $TargetListHBox/EnemyTargetList
onready var player_target_list: VBoxContainer = $TargetListHBox/PlayerTargetList

var target_item_scene = preload("res://Prototype/Battle/UI/Item.tscn")
var currently_selected_target: Vector2 = Vector2(0,0)
var previously_selected_target: Vector2 = Vector2(0,0)
var currently_selected_target_index = 0

func set_target_list() -> void:
	for enemy in BattleGlobals.enemy_party:
		add_to_target_list(enemy, ENEMY)
		
	for player in BattleGlobals.player_party:
		add_to_target_list(player, PLAYER)


func add_to_target_list(target, type) -> void:
	match type:
		ENEMY:
			var new_enemy = target_item_scene.instance()
			enemy_target_list.add_child(new_enemy)
			new_enemy.set_item_name(target[Enemies.NAME])
		PLAYER:
			var new_player = target_item_scene.instance()
			player_target_list.add_child(new_player)
			new_player.set_item_name(target[PlayerParty.NAME])
			
	set_selected(currently_selected_target)
			
	
	
func remove_from_target_list(target, type) -> void:
	pass
	
	
	
func select_next_target() -> void:
	pass
	
	
func select_previous_target() -> void:
	pass
	
	
func change_target_type(type) -> void:
	var new_type = 0
	# Switch between the different target types
	# If the type you're moving to has fewer items than the current one, do nothing
	match type:
		ENEMY:
			if not enemy_target_list.get_child_count() - 1 < int(previously_selected_target.x):
				new_type = 0 
				set_deselected()
				set_selected(Vector2(new_type, currently_selected_target.y))
		PLAYER:
			pass
	
	
func set_selected(pos:Vector2) -> void:
	var enemy_list = enemy_target_list.get_children()
	var player_list = player_target_list.get_children()
	var current_list = enemy_list
	
	previously_selected_target = currently_selected_target
	currently_selected_target = pos
	
	# The X part of the vec2 is the type that the target is in
	# 0 for enemies, 1 for players
	# The Y part of the vec2 is the specific target in that type
	if pos.x == 0:
		current_list = enemy_list
	elif pos.x == 1:
		current_list = player_list
		
	set_deselected()
	current_list[int(pos.y)].set_selected()
	
	
func set_deselected() -> void:
	var enemy_list = enemy_target_list.get_children()
	var player_list = player_target_list.get_children()
	var current_list = enemy_list
	
	# The X part of the vec2 is the type that the target is in
	# 0 for enemies, 1 for players
	# The Y part of the vec2 is the specific target in that type
	if previously_selected_target.x == 0:
		current_list = enemy_list
	elif previously_selected_target.x == 1:
		current_list = player_list
	
	current_list[int(previously_selected_target.y)].set_deselected()
