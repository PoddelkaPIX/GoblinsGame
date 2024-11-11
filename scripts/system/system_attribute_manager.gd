class_name AttributeManager extends Node

@export var status_effects_map: StatusEffectManager

@export var attributes: Array[Attribute]:
	set(value):
		attributes = value
		_attributes_names.clear()
		for attribute in attributes:
			_attributes_names[attribute.name] = attribute

var _attributes_names = {}

func get_attribute(attribute_name: String):
	if attribute_name in _attributes_names.keys():
		return _attributes_names[attribute_name]
	else:
		return null
	
func _enter_tree():
	owner.child_entered_tree.connect(_on_child_entered_tree)

func _exit_tree():
	owner.child_entered_tree.disconnect(_on_child_entered_tree)

func _on_child_entered_tree(childe):
	if childe is AttributeEffect:
		childe.apply()
