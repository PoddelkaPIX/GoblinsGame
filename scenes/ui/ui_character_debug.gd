extends Sprite3D

@onready var state_label: Label = %StateLabel
@onready var target: Character:
	set(value):
		target = value
		for state in states:
			disconnect_state(state)
		states.clear()
		for state in target.fsm.get_node('CompoundState').get_children():
			states.append(state)
		for state in states:
			connect_state(state)

var states: Array[StateChartState] = []

func _physics_process(delta: float) -> void:
	if not target:
		queue_free()
		return
	position = target.position
	position.x += 2
	position.y += 1

func connect_state(state):
	state.state_entered.connect(_on_state_entered.bind(state))

func disconnect_state(state):
	state.state_entered.disconnect(_on_state_entered)
	
func _on_state_entered(state):
	state_label.text = state.name
