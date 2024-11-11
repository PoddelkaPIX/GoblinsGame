extends MarginContainer

signal pressed()

@onready var _cooldown_progress_bar:TextureProgressBar = %CooldownProgressBar
@onready var _prepatation_progress_bar:TextureProgressBar = %PreparationProgressBar
@onready var _cooldown_label:Label = %CooldownLabel

var ability: Ability: 
	set(value):
		if value.type is AbilityActionToggle:
			if value.switched.is_connected(_on_ability_toggle_switched):
				value.switched.disconnect(_on_ability_toggle_switched)
			value.switched.connect(_on_ability_toggle_switched)
		ability = value

var _icon:Texture2D:
	set(value):
		_icon = value
		_apply_settings()

func _ready():
	clear_cooldown()
	_set_icon(ability.get_icon())
	
	if ability.has_signal('cooldown_updated'):
		ability.cooldown_updated.connect(
		func(total, value):
			set_cooldown(total, value)
	)
	if ability.has_signal('preparation_updated'):
		ability.preparation_updated.connect(
			func(total, value):
				set_preparation(total, value)
		)
	if ability.has_signal('canceled'):
		ability.canceled.connect(func(): _prepatation_progress_bar.visible = false)

func _on_ability_toggle_switched():
	_set_icon(ability.get_icon())

func _set_icon(new_icon):
	_icon = new_icon

func _apply_settings():
	if _cooldown_progress_bar != null:
		_cooldown_progress_bar.texture_under = _icon

func set_preparation(total:float, current:float):
	_prepatation_progress_bar.visible = true
	_prepatation_progress_bar.max_value = total
	_prepatation_progress_bar.value = current
	if current >= total:
		_prepatation_progress_bar.visible = false

func set_cooldown(total:float, current:float):
	if current >= total:
		clear_cooldown()
		return
		
	_cooldown_label.visible = true
	
	_cooldown_progress_bar.max_value = total
	_cooldown_progress_bar.value = total - current
	_cooldown_label.text = "%.1f" % (total - current)
	
func clear_cooldown():
	_cooldown_label.visible = false
	_cooldown_progress_bar.value = 0
	
	_cooldown_progress_bar.max_value = 100

func _on_button_pressed():
	pressed.emit()
