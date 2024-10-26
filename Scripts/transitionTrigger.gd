extends AnimationPlayer

signal transition

func signal_transition() -> void:
	transition.emit()
