extends Node3D

@onready var label_3d: Label3D = $Label3D
@onready var area_3d: Area3D = $Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label_3d.set_visible(false)

func _on_area_3d_body_entered(body: Node3D) -> void:
	label_3d.set_visible(true)

func _on_area_3d_body_exited(body: Node3D) -> void:
	label_3d.set_visible(false)
