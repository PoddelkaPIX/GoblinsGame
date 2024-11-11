extends Node

var load_screen = preload('res://scenes/screens/screen_loading.tscn')

var scene_load_status = 0
var loading_progress: Array[int] = []
var game_session_scene_path = "res://scenes/system/system_game_session.tscn"
var past_scene: String

var is_loading = false

func start_game_session(game_session_data: GameSessionData):
	is_loading = true
	past_scene = get_tree().current_scene.scene_file_path
	ResourceLoader.load_threaded_request(game_session_scene_path)
	get_tree().change_scene_to_packed.call_deferred(load_screen)

func _process(_delta):
	if is_loading:
		scene_load_status = ResourceLoader.load_threaded_get_status(game_session_scene_path, loading_progress)
		if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
			is_loading = false
			await get_tree().create_timer(0.5).timeout
			var game_session = ResourceLoader.load_threaded_get(game_session_scene_path)
			get_tree().change_scene_to_packed(game_session)
