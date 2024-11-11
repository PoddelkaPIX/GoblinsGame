@icon("res://framework/icons/fsm_transition.png")
class_name FSM_Transition extends Node

@export var to: FSM_State
@export var delay: float = 0.0

var _to_state_name: String = ""

func _init(_i_to_state_name: String = "", _delay: float = 0.0) -> void:
	_to_state_name = _i_to_state_name
	delay = _delay

func get_to_state_name() -> String:
	return String(to.name) if _to_state_name == "" else _to_state_name
