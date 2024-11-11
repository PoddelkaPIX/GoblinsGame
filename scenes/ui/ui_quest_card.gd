extends Control

var QUEST_CONDITION_CARD = preload('res://scenes/ui/ui_quest_condition_card.tscn')

var quest: Quest:
	set(value):
		quest = value
		for condition in quest.get_children():
			_create_quest_condition_card(condition)

func _enter_tree():
	quest.state_changed.connect(_on_quest_state_changed)

func _exit_tree():
	quest.state_changed.disconnect(_on_quest_state_changed)

func _ready():
	set_quest_name()

func _create_quest_condition_card(quest_condition: QuestCondition):
	var quest_condition_card = QUEST_CONDITION_CARD.instantiate()
	quest_condition_card.quest_condition = quest_condition
	%ConditionContainer.add_child(quest_condition_card)

func _on_quest_state_changed(_quest, _new_state):
	set_quest_name()
	
func set_quest_name():
	var quest_name = quest.quest_data.name
	match quest.state:
		Quest.EState.ACTIVATED:
			%QuestName.text = '[b]' + quest_name + '[/b]'
		Quest.EState.COMPLITED:
			%QuestName.text = '[s][color="gray"]' + quest_name + '[/color][/s]'
		Quest.EState.FAILED:
			%QuestName.text = '[s][color="red"]' + quest_name + '[/color][/s]'
