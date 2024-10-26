extends Label

var credits = 0
var can_add_coin = true
signal start_game

func _ready():
	update_text()

func add_credit():
	credits += 1
	update_text()
	if credits >= 2:
		start_game.emit()
		can_add_coin = false

func update_text():
	text = "CREDIT(S) " + str(credits)

func input_cooldown():
	can_add_coin = false
	$Timer.start()

func _process(delta: float) -> void:
	var input_dir = Input.get_vector("StrafeLeft", "StrafeRight", "MoveForward", "MoveBackward")
	if input_dir and can_add_coin:
		add_credit()
		input_cooldown()

func _on_timer_timeout() -> void:
	can_add_coin = true
