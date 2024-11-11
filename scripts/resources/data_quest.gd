class_name Quest extends Resource

signal state_changed(quest: Quest, state: EState)

enum EState {DEACTIVATED, ACTIVATED, COMPLITED, FAILED}

@export var name: String
@export_multiline var description: String = ''
@export var quest_conditions: Array[QuestCondition]

var state: EState = EState.ACTIVATED:
	set(value):
		state = value
		state_changed.emit(self, state)

func send_event(event: GameEvent):
	for condition in quest_conditions:
		condition.send_event(event)

#var complited_conditions = 0:
	#set(value):
		#complited_conditions = value
		#if complited_conditions == get_child_count():
			#state = EState.COMPLITED
#
#func _init(_quest_data: QuestData):
	#quest_data = _quest_data
#
#func _cteate_quest_condition(quest_condition):
	#add_child(quest_condition)
	#quest_condition.state_changed.connect(_on_condition_state_changed)
#
#func _on_condition_state_changed(_quest, new_state):
	#if new_state == QuestCondition.EState.COMPLITED:
		#complited_conditions += 1
