class_name QuestManager extends Node

@export var quests: Array[Quest] = []

func _enter_tree() -> void:
	GameEventsService.event_happened.connect(handler_event_happened)

func _exit_tree() -> void:
	GameEventsService.event_happened.disconnect(handler_event_happened)

func handler_event_happened(event: GameEvent):
	for quest in quests:
		quest.send_event(event)
