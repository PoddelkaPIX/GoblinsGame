extends Node

func scan_folder(dirname: String, extensions: PackedStringArray) -> PackedStringArray:
	var dir = DirAccess.open(dirname)
	var filepaths = PackedStringArray()

	if dir:
		dir.list_dir_begin()
		while true:
			var path := dir.get_next()
			if path == "": break

			if path.get_extension() in extensions:
				var filepath = dirname + path
				filepaths.append(filepath)

		dir.list_dir_end()

	return filepaths

func read_json_file(file_path) -> Dictionary:
	var json_as_text = FileAccess.get_file_as_string(file_path)
	var json_as_dict = JSON.parse_string(json_as_text)
	if json_as_dict: 
		return json_as_dict
	return {}
