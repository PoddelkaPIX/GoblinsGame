extends Control

var quest_condition: QuestCondition

func _ready():
	quest_condition.state_changed.connect(_on_quest_condition_state_changed)
	quest_condition.quest_condition_data.changed.connect(_update_text)
	_update_text()
	
func _update_text():
	_on_quest_condition_state_changed(null, quest_condition.state)

func _on_quest_condition_state_changed(_quest_condition, new_state):
	var title = quest_condition.quest_condition_data.title + ': ' + str(quest_condition.quest_condition_data.counter)
	match new_state:
		QuestCondition.EState.COMPLITED:
			%ConditionName.text = '[s][color="gray"]' + title + '[/color][/s]'
		QuestCondition.EState.FAILED:
			%ConditionName.text = '[s][color="red"]' + title + '[/color][/s]'
		_:
			%ConditionName.text = title

	
