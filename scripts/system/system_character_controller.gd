@icon("res://assets/icons/nodes/character_controller.png")
class_name CharacterController extends Node

@export var is_disabled = true

func _physics_process(_delta):
	if is_disabled or GameSessionStore.character == null: return
	_movement()
	_turn_to_cursor()

func _movement() -> void:
	var move_input_dir = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
	if move_input_dir != Vector2.ZERO:
		GameSessionStore.character.character_movement.move(Vector3(move_input_dir.x, 0, move_input_dir.y))

func _turn_to_cursor():
	var position = GameSessionStore.cursor_3d.position
	GameSessionStore.character.character_movement.turn(position)
