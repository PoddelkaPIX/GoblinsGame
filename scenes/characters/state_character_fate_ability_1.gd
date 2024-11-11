extends Node

@onready var agent: Character = owner

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ability_1"):
		agent.fsm.send_event('ability_1')

func _on_ability_1_state_entered() -> void:
	agent.fsm.set_expression_property('is_action', true)
	agent.animation_tree.animation_finished.connect(_on_animation_finished)

func _on_ability_1_state_exited() -> void:
	agent.animation_tree.animation_finished.disconnect(_on_animation_finished)

func _on_animation_finished(anim_name):
	if anim_name == 'attack':
		agent.fsm.set_expression_property('is_action', false)
