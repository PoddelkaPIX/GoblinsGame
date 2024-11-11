class_name AIData extends Resource

enum EType {PEACEFUL, AGRESSIVE, NEUTRAL}

@export var type: EType
@export var characters_detector_radius: float = 5

@export var ai_aggression_module_data: AI_AggressionModuleData
