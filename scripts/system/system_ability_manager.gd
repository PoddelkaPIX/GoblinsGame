class_name AbilityManager extends Node

# TODO: Применять статус эффекты к способностям
@export_category("Managers")
@export var attribute_manager: AttributeManager
@export var status_effect_manager: StatusEffectManager

# FIXME: Запретить возможность активации навака, если один такой уже включон. 

var is_disabled = false

@export var ability_group_names: Array[StringName] = []
@export var currnet_ability_group_name: StringName

func _ready() -> void:
	InputController.input_detected.connect(_on_input_detected)

	for ability in get_tree().get_nodes_in_group('Ability'):
		ability.attribute_manager = attribute_manager
		ability.status_effect_manager = status_effect_manager

func _on_input_detected(event, action, input_type):
	pass

#func send_input_event(key):
	#if not key in input_keys.keys(): return
	#
	#if key == 'cancel':
		#_cancel_ability(input_keys[key])
	#else: 
		#_activate_ability(input_keys[key])

#func _cancel_ability(ability: Ability):
	#ability.cancel()
#
#func _activate_ability(ability: Ability):
	#ability.activate()

#func _process(delta):
	#for ability in abilities:
		#if ability == null: continue
		#ability.update(delta)
