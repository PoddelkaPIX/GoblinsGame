extends Node

var acts: Array[Act] = [
	Act.new(
		'1',
		["res://scenes/maps/map_home_in_forest.tscn"]
	)
]

class Act:
	var name: StringName
	var maps: Array[String]
	
	func _init(_name: StringName, _maps: Array[String]) -> void:
		name = _name
		maps = _maps
