extends Node

func save_data(data: Resource, file_path: String):
	data.resource_path = file_path
	var result = ResourceSaver.save(data, file_path,  ResourceSaver.FLAG_CHANGE_PATH)
	assert(result == OK)
	
func load_data(file_path) -> Resource:
	if ResourceLoader.exists(file_path):
		return ResourceLoader.load(file_path)
	return null
