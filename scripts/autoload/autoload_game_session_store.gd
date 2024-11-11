extends Node

signal character_selected(character: Character)

var cursor_3d: Node
var main_character: Character: 
	set(value):
		main_character = value
		character_selected.emit(value)
var main_camera: Camera3D
