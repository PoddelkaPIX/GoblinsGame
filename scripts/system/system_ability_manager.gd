class_name AbilityManager extends Node

# TODO: Применять статус эффекты к способностям
@export_category("Managers")
@export var attribute_manager: AttributeManager
@export var status_effect_manager: StatusEffectManager
@export var _abilities: Dictionary[String, Ability]

var is_disabled = false

enum Event {
	Ability1KeyPressed,
	Ability1KeyReleased,
	Ability2KeyPressed,
	Ability2KeyReleased,
	Ability3KeyPressed,
	Ability3KeyReleased,
}

func triggered(key:  String):
	var ability = _abilities[key]
	if ability == null: return
	
	if has_mana(ability) == false: return
	
	var ability_state = ability.get_state()
	

#region Условия
func has_mana(ability: Ability) -> bool:
	var mana: Attribute = attribute_manager.get_attribute('Mana')
	if mana and mana.value - ability.get_mana() >= 0:
		return true
	return false
	
#func has_energy() -> bool:
	#var energy: Attribute = attribute_manager.get_attribute('Energy')
	#if energy and energy.value - _enegry >= 0:
		#return true
	#return false
#endregion
