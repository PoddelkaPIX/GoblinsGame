extends MarginContainer


@onready var total_volume_slider_component: SliderComponent = $VBoxContainer/TotalVolume/HBox/SliderComponent
@onready var music_volume_slider_component: SliderComponent = $VBoxContainer/MusicVolume/HBox/SliderComponent

@onready var game_settings: GameSettings = GameSettingsStore.game_settings
@onready var changes = {
	'total_volume': game_settings.total_volume,
	'music_volume': game_settings.music_volume
}

func _ready() -> void:
	fill_total_volume()

func _physics_process(_delta: float) -> void:
	if visible == false: return

func set_setting(setting_name: String, value):
	game_settings[setting_name] = value
	GameSettingsStore.save_game_settings()
	
func fill_total_volume():
	total_volume_slider_component.set_params(0, 1, 0.01, game_settings.total_volume)
	music_volume_slider_component.set_params(0, 1, 0.01, game_settings.music_volume)
	total_volume_slider_component.value_changed.connect(_on_total_volume_slider_component_value_changed)
	music_volume_slider_component.value_changed.connect(_on_total_volume_slider_component_value_changed)

func _on_total_volume_slider_component_value_changed(value: float) -> void:
	set_setting('total_volume', value)

func _on_slider_component_value_changed(value: float) -> void:
	set_setting('music_volume', value)
