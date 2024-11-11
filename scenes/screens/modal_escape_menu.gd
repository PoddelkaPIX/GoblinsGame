extends Control

@onready var continue_btn: Button = %ContinueBtn

func _init() -> void:
	visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('escape'):
		toggle()

func _on_settiongs_btn_pressed() -> void:
	%ScreenSettingsMenu.visible = true
	pass

func _on_main_menu_btn_pressed() -> void:
	get_tree().paused = false
	Router.push(Router.Route.MAIN_MENU)

func _on_continue_btn_pressed() -> void:
	toggle()

func toggle():
	visible = !visible
	get_tree().paused = visible
	process_mode = ProcessMode.PROCESS_MODE_ALWAYS
	if visible:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED_HIDDEN)

func _on_visibility_changed() -> void:
	continue_btn.grab_focus()
