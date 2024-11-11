class_name  QuestConditionType extends Resource

@export var event_params_targeted = {}

func send_event(event: GameEvent):
	if not event.params.has_all(event_params_targeted.keys()): return
	
#region Типы
class QuestConditionTypeCounter extends QuestConditionType:
	@export var counter: int = 0:
		set(value):
			counter = clamp(value, 0, target_value)
			emit_changed()

	@export var target_value: int = 1

	func send_event(event: GameEvent):
		send_event(event).super()
		if event_params_targeted.keys().has('count'):
			counter += event_params_targeted['count']

class QuestConditionTypeFlag extends QuestConditionType:
	@export var flag: bool = false:
		set(value):
			flag = value
			emit_changed()
#endregion
