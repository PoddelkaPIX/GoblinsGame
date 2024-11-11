extends Control

func _process(_delta):
	if len(Router.loading_progress) > 0:
		%ProgressBar.value = snapped(Router.loading_progress[0], 0.01)
