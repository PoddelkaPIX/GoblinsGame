class_name AbilityActionToggle extends AbilityAction
signal switched

@export var passive_abilities: Array[AbilityActionPassive] = [null, null]
@export var current_ability_index: int:
	set(value):
		current_ability_index = clamp(value, 0, 1)
		switched.emit()

func get_current_ability() -> AbilityActionPassive:
	return passive_abilities[current_ability_index]

func get_description() -> String:
	return get_current_ability().get_description()

func get_icon():
	return get_current_ability().get_icon()
	
func activate():
	_toggle()

func update(delta):
	get_current_ability().update(delta)

func _toggle():
	if get_current_ability() == passive_abilities[0]:
		current_ability_index = 1
	else:
		current_ability_index = 0
