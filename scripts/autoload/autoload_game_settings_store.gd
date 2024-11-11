extends Node

var game_config: GameConfig = load("res://config/game_config.tres")
var game_settings: GameSettings = load(game_config.game_settings_file_path)

func _enter_tree():
	apply_game_settings()

func apply_game_settings():
	_apply_keyboard_settings()
	_apply_joypad_keyboard_settings()
	_apply_screen_settings()
	_apply_sound_settings()
	
func _apply_keyboard_settings():
	InputMap.action_add_event('move_left', game_settings.move_left_key)
	InputMap.action_add_event('move_right', game_settings.move_right_key)
	InputMap.action_add_event('move_up', game_settings.move_up_key)
	InputMap.action_add_event('move_down', game_settings.move_down_key)
	InputMap.action_add_event('jump', game_settings.jump_key)

	InputMap.action_add_event('ability_1', game_settings.ability_1_key)
	InputMap.action_add_event('ability_2', game_settings.ability_2_key)
	InputMap.action_add_event('ability_3', game_settings.ability_3_key)
	InputMap.action_add_event('ability_4', game_settings.ability_4_key)
	InputMap.action_add_event('ability_5', game_settings.ability_5_key)
	InputMap.action_add_event('ability_6', game_settings.ability_6_key)
	
	InputMap.action_add_event('interaction', game_settings.interaction_key)

func _apply_joypad_keyboard_settings():
	InputMap.action_add_event('jump', game_settings.gp_jump_key)
	
func _apply_screen_settings():
	ProjectSettings.set_setting('display/window/size/viewport_width', game_settings.width)
	ProjectSettings.set_setting('display/window/size/viewport_height', game_settings.height)
	
	if game_settings.window_mode == DisplayServer.window_get_mode():
		return
	
	match game_settings.window_mode:
		DisplayServer.WINDOW_MODE_FULLSCREEN:
			ProjectSettings.set_setting('display/window/size/mode', Window.MODE_FULLSCREEN)
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		DisplayServer.WINDOW_MODE_WINDOWED:
			ProjectSettings.set_setting('display/window/size/mode', Window.MODE_WINDOWED)
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _apply_sound_settings():
	AudioServer.set_bus_volume_db(0, linear_to_db(game_settings.total_volume))
	AudioServer.set_bus_volume_db(1, linear_to_db(game_settings.music_volume))
	AudioServer.set_bus_volume_db(2, linear_to_db(game_settings.effects_volume))

func save_game_settings():
	ResourceSaver.save(game_settings, game_settings.resource_path)
	apply_game_settings()
