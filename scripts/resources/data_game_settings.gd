class_name GameSettings extends Resource

enum EWindowMode {WINDOWED=0, FULL_SCREEN=3}

@export_group('Game')


@export_group('Video')
@export var width: int = 1920
@export var height: int = 1080
@export var window_mode: EWindowMode = EWindowMode.WINDOWED
@export_enum("High", "Medium", "Low", "Custom") var graphics_quality = "High"

@export_group('Audio')
@export_range(0, 1, 0.01) var total_volume: float = 1
@export_range(0, 1, 0.01) var music_volume: float = 1
@export_range(0, 1, 0.01) var effects_volume: float = 1
@export var audio: bool = true
@export var music: bool = true

@export_group('Keyboard')
@export_subgroup('Movement')
@export var move_left_key: InputEventKey
@export var move_right_key: InputEventKey
@export var move_up_key: InputEventKey
@export var move_down_key: InputEventKey
@export var jump_key: InputEvent
@export var gp_jump_key: InputEventJoypadButton
@export_subgroup('Abilities')
@export var ability_1_key: InputEvent
@export var ability_2_key: InputEvent
@export var ability_3_key: InputEvent
@export var ability_4_key: InputEvent
@export var ability_5_key: InputEvent
@export var ability_6_key: InputEvent
@export_subgroup('Other')
@export var interaction_key: InputEvent

@export_group('Controller')
