class_name Ability extends Node
signal canceled

signal state_ready_entered()
signal state_ready_exited()
signal state_preparation_entered()
signal state_preparation_exited()
signal state_execution_entered()
signal state_execution_exited()
signal state_recovery_entered()
signal state_recovery_exited()
signal state_cooldown_entered()
signal state_cooldown_exited()
	
enum EInputMode { ONE_PRESS, HOLD_PRESS }

const STATE_READY = 'READY' 
const STATE_PREPARATION = 'PREPARATION' 
const STATE_EXECUTION = 'EXECUTION'
const STATE_RECOVERY = 'RECOVERY'
const STATE_COOLDOWN = 'PREPARATION' 

@export_category('Ability')
@export var _name: StringName = ''
@export_multiline var _description: String = ''
@export var _icon: CompressedTexture2D

@export_category('Timings')
@export var _cooldown_time: float = 0.2

@export_category("Cost")
@export var _enegry: float = 0
@export var _mana: float = 0

@export_category('Input')
@export var _input_mode: EInputMode = EInputMode.ONE_PRESS
@export var _is_cancelable: bool = true
@export var _input_key_name: String = 'ability_'
@export_category('Timings')
@export var _preparation_time: float = 0.1
@export var _execution_time: float = 0.01
@export var _recovery_time: float = 0.1
@export var _cancel_time: float = 0.2

var attribute_manager: AttributeManager
var status_effect_manager: StatusEffectManager

var _current_state = STATE_READY
var _state_timer: float = 0.0

func activate():
	if not has_mana(): return
	if not has_energy(): return
	if not _current_state == STATE_READY: return
	
	_current_state = STATE_PREPARATION

func set_state(new_state):
	if new_state == _current_state: return
	_current_state = new_state
	match _current_state:
		STATE_PREPARATION:
			state_preparation_entered.emit()
		STATE_EXECUTION:
			state_execution_entered.emit()
		STATE_RECOVERY:
			state_recovery_entered.emit()
		STATE_COOLDOWN:
			state_cooldown_entered.emit()

func cancel():
	if _current_state == STATE_PREPARATION:
		_current_state = STATE_COOLDOWN
		_state_timer = _cancel_time
		canceled.emit()

func _physics_process(delta: float):
	if _current_state == STATE_READY: return
	
	match _current_state:
		STATE_PREPARATION:
			if _input_mode == 1:
				cancel()
				return
			_state_timer += delta
			if _state_timer >= _preparation_time:
				_current_state = STATE_EXECUTION
				_state_timer = 0
		STATE_EXECUTION:
			_state_timer += delta
			if _state_timer >= _execution_time:
				_current_state = STATE_RECOVERY
				_state_timer = 0
		STATE_RECOVERY:
			_state_timer += delta
			if _state_timer >= _recovery_time:
				_current_state = STATE_COOLDOWN
				_state_timer = 0
		STATE_COOLDOWN:
			_state_timer += delta
			if _state_timer >= _cooldown_time:
				_current_state = STATE_READY
				_state_timer = 0
	_update(delta)

func activation_effect():
	pass

func use_passive_effect():
	pass

func _update(delta):
	pass

#region Условия
func has_mana() -> bool:
	var mana: Attribute = attribute_manager.get_attribute('Mana')
	if mana and mana.value - _mana >= 0:
		return true
	return false
	
func has_energy() -> bool:
	var energy: Attribute = attribute_manager.get_attribute('Energy')
	if energy and energy.value - _enegry >= 0:
		return true
	return false
#endregion
