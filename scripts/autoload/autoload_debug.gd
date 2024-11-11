extends Node

@onready var UI_CHARACTER_DEBUG_INSTANCE = preload("res://scenes/ui/ui_character_debug.tscn")

var is_debuging = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('ui_filedialog_refresh'):
		is_debuging = !is_debuging

func _ready() -> void:
	Router.scene_changed.connect(_on_router_current_scene_changed)
	
func _on_router_current_scene_changed():
	var map = Router.current_scene
	if map is Map:
		map.characters.child_entered_tree.connect(_on_map_characters_child_entered_tree)
		for character in map.characters.get_children():
			add_ui_character_debuger(character)
		
func _on_map_characters_child_entered_tree(map: Node):
	if map is Character:
		add_ui_character_debuger(map)

func add_ui_character_debuger(character: Character):
	var ui_character_debuger = UI_CHARACTER_DEBUG_INSTANCE.instantiate()
	ui_character_debuger.target = character
	add_child(ui_character_debuger)
