@icon("res://assets/icons/nodes/effect_map.png")
class_name StatusEffectManager extends Node

var _effects_dict: Dictionary = {}

func _ready():
	_listen_new_effects()

func add_effect(effect: StatusEffect):
	_effects_dict[effect.name] = effect
	add_child(effect)

func _listen_new_effects():
	owner.child_entered_tree.connect(_child_entered_tree_handler)

func _child_entered_tree_handler(node: Node):
	if node is StatusEffect:
		add_effect(node)

func process_attribute_effect(node: AttributeEffect):
	return node
