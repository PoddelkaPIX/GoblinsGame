class_name GameEvent extends Resource

var params: Dictionary = {}
var category: Consts.GameEventCategory
var text: String

func _init(_name: String, _params: Dictionary, _category: Consts.GameEventCategory, _text: String) -> void:
	params = _params
	category = _category
	text = _text
	
