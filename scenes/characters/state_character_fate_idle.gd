extends Node

@onready var agent = owner

func _physics_process(_delta: float) -> void:
	var move_input_dir = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
	
	if agent.fsm.get_expression_property('is_action') == true: return
	if move_input_dir != Vector2.ZERO: return
	if not agent.is_on_floor(): return
	
	agent.fsm.send_event('idle')

func _on_moving():
	#owner.fsm.send_event('move')
	pass

func _on_idle_state_entered() -> void:
	#owner.movement.moving.connect(_on_moving)
	pass

func _on_idle_state_exited() -> void:
	#owner.movement.moving.disconnect(_on_moving)
	pass


func _on_idle_state_physics_processing(_delta: float) -> void:
	_turn_to_cursor()
	
func _turn_to_cursor():
	var position = get_tree().current_scene.cursor_3d.global_position
	get_tree().current_scene.main_character.movement.turn(position)
