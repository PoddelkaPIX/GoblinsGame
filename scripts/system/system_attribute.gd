class_name Attribute extends Resource

signal value_changed(value)
signal min_value_changed(value)
signal max_value_changed(value)

@export var name: String = ''

@export_category('Values')
@export var value := 0.0:
	set(new_value):
		value = new_value
		value_changed.emit(value)
@export var min_value := 0.0:
	set(new_value):
		min_value = new_value
		min_value_changed.emit(min_value)
@export var max_value := 0.0:
	set(new_value):
		max_value = new_value
		max_value_changed.emit(max_value)
#
#func apply_status_effects(value: float) -> float:
	#if status_effects_map == null: return value
	#
	#var buffed = 0
	#var debuffed = 0
	#
	#for status_effect: StatusEffect in status_effects_map.get_children():
		#if name not in status_effect.modifiable_attributes: return value
		#if status_effect.type == StatusEffect.EType.BUFF:
			#buffed += status_effect.modify(value)
		#if status_effect.type == StatusEffect.EType.DEBUFF:
			#debuffed += status_effect.modify(value)
#
	#return value + (buffed - debuffed)
