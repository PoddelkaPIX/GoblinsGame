class_name AttributeEffect extends Node

@export var value: float

func _init(_value: float = 0):
	value = _value

func apply():
	_apply()
	queue_free()
	
func _apply():
	pass
