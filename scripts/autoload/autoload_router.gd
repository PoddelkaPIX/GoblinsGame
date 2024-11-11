extends Node

signal scene_changed

const LOADING_SCREEN = preload('res://scenes/screens/screen_loading.tscn')

enum Route  {MAIN_MENU, SETTING_MENU, TEST_ROOM, GAME_SESSION}

var routes: Dictionary[Route, String] = {
	Route.MAIN_MENU: "res://scenes/screens/screen_main_menu.tscn",
	Route.SETTING_MENU: "res://scenes/screens/screen_settings_menu.tscn",
	Route.TEST_ROOM: "res://scenes/maps/map_test_room.tscn",
	Route.GAME_SESSION: "res://scenes/system/system_game_session.tscn"
}

var last_scene_name = null
var current_scene: Node = null

var scene_load_status = 0
var loading_progress: Array[int] = []

func push(route_name: Route, is_loading=false):
	var loading_screen: Node
	if routes.has(route_name) == false:
		ToastParty.show({
			'text': 'Путь не найден!'
		})
		return
		
	if is_loading:
		loading_screen = LOADING_SCREEN.instantiate()
		get_parent().add_child(loading_screen)
	change_scene(load_scene(routes[route_name]))

	if is_loading:
		loading_screen.queue_free()

func load_scene(scene_path: String) -> PackedScene:
	ResourceLoader.load_threaded_request(scene_path)

	while true:
		scene_load_status = ResourceLoader.load_threaded_get_status(scene_path, loading_progress)
		if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
			return ResourceLoader.load_threaded_get(scene_path)
	return null

func change_scene(new_scene: PackedScene):
	get_tree().change_scene_to_packed(new_scene)
	emit_signal("scene_changed")
