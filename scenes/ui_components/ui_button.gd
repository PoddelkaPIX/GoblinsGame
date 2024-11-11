extends Button

func _on_pressed() -> void:
	$AudioClick.playing = true

func _on_focus_entered() -> void:
	%AudioFocusButton.playing = true
