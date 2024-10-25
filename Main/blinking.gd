extends Label

@export var Time_On = 0.5
@export var Time_Off = 0.5

var timer = Timer.new()

func _ready() -> void:
	add_child(timer)
	$".".set_visible(false)
	timer.connect("on_timer_timeout", self, "_on_timer_timeout")
	timer.start(Time_Off)

func _on_timer_timeout():
	if !$".".is_visible():
		$".".set_visible(true)
		timer.start(Time_On)
	else:
		$".".set_visible(false)
		timer.start(Time_Off)
