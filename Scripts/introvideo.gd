extends VideoStreamPlayer

func _on_finished() -> void:
	print("freeing intro video")
	get_node("/root/Intro").free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_dir = Input.get_vector("StrafeLeft", "StrafeRight", "MoveForward", "MoveBackward")
	if input_dir:
		print("skipping intro")
		get_node("/root/Intro").free()
