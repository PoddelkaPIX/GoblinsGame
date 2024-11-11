class_name GameSession extends Node

@export var data: GameSessionData

@export var _cursor_3d: Cursor3D:
	set(value):
		#GameSessionStore.cursor_3d = value
		_cursor_3d = value

@export var _character: Character:
	set(value):
		#GameSessionStore.character = value
		_character = value

@export var _main_camera: MainCamera:
	set(value):
		#GameSessionStore.main_camera = value
		_main_camera = value

@onready var mission: Mission = get_node_or_null('Mission')

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED_HIDDEN)

func save_game_session(file_path: String):
	var game_session_data: GameSessionData = get_tree().current_scene.game_session_data.duplicate()
	
	DataManager.save_data(game_session_data, file_path)
