extends View

@onready var play_game_btn: Button = %PlayGame

func  _ready() -> void:
	play_game_btn.grab_focus()

func _enter_tree() -> void:
	InputController.input_device_changed.connect(_on_input_device_changed_handler)

func _exit_tree() -> void:
	InputController.input_device_changed.disconnect(_on_input_device_changed_handler)
	
func _on_input_device_changed_handler(device):
	if (device == InputController.InputDevice.JOYPAD):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	
func _on_settings_pressed() -> void:
	Router.push(Router.Route.SETTING_MENU)


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_play_game_pressed() -> void:
	Router.push(Router.Route.TEST_ROOM, true)
