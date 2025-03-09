extends CharacterBody3D

const SPEED = 5.0
const SENSITIVITY = 0.01
const JUMP_VELOCITY = 4.5
var tap_threshold = 20 # Maximum movement in pixels to consider it a tap
@export var selected = false
@onready var player = $"."
var dragging = false
var initial_position = Vector2.ZERO

func _input(event: InputEvent) -> void:
	#if event is a touch input
	if event is InputEventScreenTouch:
		#check if it is pressed, assume it is not dragging
		if event.is_pressed():
			dragging = false
			initial_position = event.position
		# compare initial position of tap to the current position
		# if the position difference is not too much the consider it as a tap, else do not tap
		else:
			if not dragging:
				if event.position.distance_to(initial_position) <= tap_threshold:
					print("tap")
					jump()

	elif event is InputEventScreenDrag:
		handle_screen_drag(event)
	
func _timer_start():
	var timer = Timer.new()
	timer.wait_time = 0.1
	timer.one_shot = true
	add_child(timer)
	timer.connect("timeout", Callable(self, "_on_timer_end"))
	timer.start()

func _on_timer_end():
	return true

func _ready() -> void:
	
	add_to_group("player")

func _physics_process(delta: float) -> void:
	Global.points += 1

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()

func handle_screen_drag(event):
	var direction = event.relative
	position.x -= direction.x * SENSITIVITY

func jump():
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
