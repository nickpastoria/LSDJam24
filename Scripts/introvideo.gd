extends VideoStreamPlayer

signal intro_done

func _on_finished() -> void:
	$".".stop()
	intro_done.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_dir = Input.get_vector("StrafeLeft", "StrafeRight", "MoveForward", "MoveBackward")
	if input_dir:
		$".".stop()
		intro_done.emit()

	
