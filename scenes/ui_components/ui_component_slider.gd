class_name SliderComponent extends HBoxContainer

signal value_changed(value: float)

var min_value: float
var max_value: float
var step: float
var value: float

@onready var minus_btn: Button = %MinusBtn
@onready var slider: HSlider = %HSlider
@onready var plus_btn: Button = %PlusBtn
@onready var procent_label: Label = %ProcentLabel

func set_params(_min_value: float, _max_value: float, _step: float, _value: float):
	min_value = _min_value
	max_value = _max_value
	step = _step
	value = _value
	update_slider_params()

func update_slider_params():
	slider.min_value = min_value
	slider.max_value = max_value
	slider.step = step
	slider.value = value

func _on_minus_btn_pressed() -> void:
	slider.value -= step

func _on_plus_btn_pressed() -> void:
	slider.value += step

func _on_h_slider_value_changed(_value: float) -> void:
	value_changed.emit(_value)
	procent_label.text = str(_value / max_value * 100)
