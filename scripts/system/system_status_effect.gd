class_name StatusEffect extends Node

enum EType {BUFF, DEBUFF}

var modifiable_attributes: Array[String] = []
var duration_time: float
var type: EType

func _ready():
	_entered()

func _process(delta):
	duration_time -= delta
	
	if duration_time <= 0:
		_exited()
		queue_free()

func modify(_value: float):
	pass

func _entered():
	pass
	
func _exited():
	pass
