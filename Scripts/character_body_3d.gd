extends CharacterBody3D

const SPEED = 5
const ACCEL = 0.75
const FRICTION = 0.5
const JUMP_VELOCITY = 4.5
const SENSITIVITY = 0.003
const AIR_CONTROL = 0.2

@onready var head = $Head
@onready var camera = $Head/Camera3D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))

func _physics_process(delta: float) -> void:
	# Add the gravity.
	var final_accel = ACCEL
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		final_accel *= AIR_CONTROL

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		# Apply friction

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("StrafeLeft", "StrafeRight", "MoveForward", "MoveBackward")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x += direction.x * final_accel
		velocity.z += direction.z * final_accel
		velocity = velocity.limit_length(SPEED)
	
	# If the player velocity is zero then set the velocity to zero
	if velocity.length() < 0.1:
		velocity *= Vector3.ZERO
		
	# Apply ground friction to player
	if !velocity.is_zero_approx() && is_on_floor():
		# Apply friction vector in opposite dirction of player movement vector
		var friction = Vector3(velocity).normalized() * FRICTION
		velocity -= friction
		
		
			
	move_and_slide()
