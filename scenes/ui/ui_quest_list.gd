extends Control

var QUEST_CARD = preload("res://scenes/ui/ui_quest_card.tscn")
@export var quest_manager: QuestManager

func _ready():
	for quest in quest_manager.quests:
		_create_quest_card(quest)
	
func _create_quest_card(quest: Quest):
	var quest_card = QUEST_CARD.instantiate()
	quest_card.quest = quest
	%QuestCardContainer.add_child(quest_card)
