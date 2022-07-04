extends GridContainer

var spell_scene = preload("res://Battle/UI/Spell.tscn")


func process_input() -> void:
	pass


func add_spell_to_list(spell_data) -> void:
	var spell = spell_scene.instance()
	add_child(spell)
	spell.set_data(spell_data)


func populate_list(member_data) -> void:
	for spell in member_data[PlayerParty.SPELLS]:
		add_spell_to_list(spell)

	get_child(0).set_selected()
