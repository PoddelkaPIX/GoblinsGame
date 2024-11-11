extends Control

var ABILITY_BUTTON = preload('res://scenes/ui/ui_ability_button.tscn')

@onready var ability_buttons_container = %SkillButtonsContainer

@onready var target: Character = GameSessionStore.character

func _enter_tree() -> void:
	GameSessionStore.character_selected.connect(_on_character_selected)
	
func _ready():
	fill_abitity_buttons()

func _on_character_selected(character: Character):
	target = character
	fill_abitity_buttons()

func fill_abitity_buttons():
	if target == null: return
	
	for ability in target.ability_manager.abilities:
		if ability == null: continue
		
		var ability_button = ABILITY_BUTTON.instantiate()
		ability_button.ability = ability
		ability_buttons_container.add_child(ability_button)
	
