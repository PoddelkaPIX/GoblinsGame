class_name QuestCondition extends Resource

signal state_changed(quest_condition: QuestCondition, state: EState)

enum EState {ACTIVATED, COMPLITED, FAILED}

@export var title: String = ''
@export var type: QuestConditionType
@export var event_category: Consts.GameEventCategory

var state: EState = EState.ACTIVATED:
	set(value):
		state = value
		state_changed.emit(self, state)

func send_event(event: GameEvent):
	if event_category != event.category: return
	
	

#func _enter_tree():
	#QuestManager.event_happened.connect(_event_handler)
#
#func _exit_tree():
	#QuestManager.event_happened.disconnect(_event_handler)
		
#func _event_handler(_event: String):
	#if quest_condition.event == _event:
		#quest_condition_data.counter += 1
	#
	#if quest_condition_data.counter == quest_condition_data.target_value:
		#state = EState.COMPLITED
