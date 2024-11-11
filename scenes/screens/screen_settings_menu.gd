extends Control

@export var previous_node: Control

func _ready() -> void:
	%SOUND.grab_focus()

func _enter_tree() -> void:
	InputController.input_device_changed.connect(_on_input_device_changed_handler)
	
func _exit_tree() -> void:
	InputController.input_device_changed.disconnect(_on_input_device_changed_handler)
	
func _on_input_device_changed_handler(device):
	if (device == InputController.InputDevice.JOYPAD):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _on_back_pressed() -> void:
	Router.push(Router.Route.MAIN_MENU)

func _on_sound_pressed() -> void:
	hide_views()
	%SoundSettingsView.visible = true 

func _on_video_pressed() -> void:
	hide_views()
	%VideoSettingsView.visible = true 
	
func hide_views():
	%VideoSettingsView.visible = false 
	%SoundSettingsView.visible = false 
