class_name AbilityData extends Resource

signal state_changed(current, previous)

signal cooldown_updated(total, value)

@export var _name: StringName
@export_multiline var _description: String
@export var _icon: CompressedTexture2D
@export_category('Timings')
@export var cooldown_time: float = 0.2
@export_category("Cost")
@export var _enegry: float = 0
@export var _mana: float = 0
@export_category('Additionally')
@export var active_action: AbilityActionActive
@export var passive_action: AbilityActionPassive

var agent: Character

var _current_state: String = Consts.ABILITY_STATE_READY

func get_description() -> String:
	return _description

func get_icon():
	return _icon
	
func get_state():
	return _current_state

func set_state(_new_state):
	state_changed.emit(_new_state, _current_state)
	_current_state = _new_state

func update(_delta):
	pass

func activate():
	pass
