@icon("res://assets/icons/nodes/character.png")
class_name Character extends CharacterBody3D

signal collided(character: Character, object: Node3D)
signal focuses_on_position(value: bool)

@onready var ability_manager: AbilityManager = %AbilityManager
@onready var attribute_manager: AttributeManager = %AttributeManager
@onready var status_effect_manager: StatusEffectManager = %StatusEffectManager
@onready var movement: CharacterMovement = %Movement
@onready var animation_tree: AnimationTree = %AnimationTree
@onready var fsm: StateChart = %StateChart

func _physics_process(delta):
	movement.friction(delta)
	movement.apply_gravity(delta)
	move_and_slide()

func death():
	set_collision_layer_value(2, false)
	await get_tree().create_timer(1).timeout
	queue_free()
