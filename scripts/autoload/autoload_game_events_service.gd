extends Node

signal event_happened(event: GameEvent)

func send_event(event: GameEvent):
	event_happened.emit(event)
