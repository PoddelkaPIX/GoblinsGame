class_name Map extends Node3D

@export var main_character: Character

@onready var walls = %Walls
@onready var grounds = %Grounds
@onready var props = %Props
@onready var characters = %Characters
@onready var interactive_objects = %InteractiveObjects
@onready var main_camera: MainCamera = %MainCamera
@onready var quest_manager: QuestManager = %QuestManager
@onready var cursor_3d: Cursor3D = %Cursor3D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED_HIDDEN)
