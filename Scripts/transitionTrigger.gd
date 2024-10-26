extends AnimationPlayer

signal transition

func signal_transition() -> void:
	transition.emit()

func _on_animation_finished(anim_name: StringName) -> void:
	$"../..".queue_free()
