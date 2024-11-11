extends MarginContainer

@onready var screen_mode: OptionButton = %OptionButton

func _ready() -> void:
	pass

func fill_video_settings():
	fill_screen_modes()
	
func fill_screen_modes():
	for i in GameSettings.EWindowMode.keys():
		screen_mode.add_item(i)
	screen_mode.select(1)
