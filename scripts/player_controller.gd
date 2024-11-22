class_name PlayerController extends Node

var agent: Character = owner 

func movement():
	var move_input_dir = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
	if owner.fsm.get_expression_property('is_action') == true: return

	if move_input_dir == Vector2.ZERO: return
	if not owner.is_on_floor(): return
	#owner.fsm.send_event('move')

func abilities():
	if Input.is_action_just_pressed("ability_3"):
		agent.ability_manager.triggered("ability_3"):
		

func _physics_process(delta: float) -> void:
	movement()
	abilities()
