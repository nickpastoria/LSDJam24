extends Node3D
var SCENES_FOLDER = "res://Scenes/"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var files = dir_contents(SCENES_FOLDER)
	pick_random_level(files)
	
func pick_random_level(files):
	var num_scenes = files.size()
	var selection = randi_range(0, num_scenes-1)
	print("selected scene: " + str(selection) + " ... " + files[selection])
	create_scene(SCENES_FOLDER + files[selection])
	
func create_scene(scene_path) -> void:
	print("loading file: " + scene_path)
	var scene = load(scene_path).instantiate()
	add_child(scene)

func dir_contents(path):
	var dir = DirAccess.open(path)
	var files = []
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
				files.push_back(file_name)
			file_name = dir.get_next()
		return files
	else:
		print("An error occurred when trying to access the path.")
		return null
