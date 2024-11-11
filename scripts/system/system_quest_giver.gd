class_name QuestGiver extends Node

#func give_quest(quest_name) -> bool:
	#var quest: Quest = get_node_or_null(quest_name)
	#if quest != null:
		#quest.giver_name = owner.name
		#QuestsController.add_accessed_quest(quest.duplicate())
		#return true
	#else:
		#return false
