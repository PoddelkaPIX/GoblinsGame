class_name CharacterManagement extends Node

func add_character(character: Character, position: Vector3):
	character.transform.origin = position
	add_child(character)
