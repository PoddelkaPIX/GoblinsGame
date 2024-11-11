class_name AbilityActionActive extends AbilityAction
signal canceled

signal preparation_updated(total, value)
signal execution_updated(total, value)
signal recovery_updated(total, value)
signal preparation_entered
signal execution_entered
signal recovery_entered
signal cooldown_entered

enum EInputMode { ONE_PRESS, HOLD_PRESS }

const STATE_PREPARATION = 'PREPARATION' 
const STATE_EXECUTION = 'EXECUTION'
const STATE_RECOVERY = 'RECOVERY'

@export_category('Input')
@export var input_mode: EInputMode = EInputMode.ONE_PRESS
@export var is_cancelable: bool = true

@export_category('Timings')
@export var preparation_time: float = 0.1
@export var execution_time: float = 0.01
@export var recovery_time: float = 0.1
@export var cancel_time: float = 0.2

var state_timer: float = 0.0

#func set_state(new_state):
	#match get_state():
		#STATE_PREPARATION:
			#_preparation_enter()
		#STATE_EXECUTION:
			#_execution_enter()
		#STATE_RECOVERY:
			#_recovery_enter()
		#STATE_COOLDOWN:
			#_cooldown_enter()
	#super.set_state(new_state)
#
#func cancel():
	#if _current_state == STATE_PREPARATION:
		#_current_state = STATE_COOLDOWN
		#state_timer = cancel_time
		#canceled.emit()
#
#func update(delta):
	#if _current_state == STATE_READY: return
	#
	#match _current_state:
		#STATE_PREPARATION:
			#if input_mode == 1:
				#cancel()
				#return
			#state_timer += delta
			#preparation_updated.emit(preparation_time, state_timer)
			#if state_timer >= preparation_time:
				#_current_state = STATE_EXECUTION
				#state_timer = 0
		#STATE_EXECUTION:
			#state_timer += delta
			#execution_updated.emit(execution_time, state_timer)
			#if state_timer >= execution_time:
				#_current_state = STATE_RECOVERY
				#state_timer = 0
		#STATE_RECOVERY:
			#state_timer += delta
			#recovery_updated.emit(recovery_time, state_timer)
			#if state_timer >= recovery_time:
				#_current_state = STATE_COOLDOWN
				#state_timer = 0
		#STATE_COOLDOWN:
			#state_timer += delta
			#cooldown_updated.emit(cooldown_time, state_timer)
			#if state_timer >= cooldown_time:
				#_current_state = STATE_READY
				#state_timer = 0
	#_update(delta)
#
#func activate():
	#if _current_state == STATE_READY:
		#_current_state = STATE_PREPARATION
