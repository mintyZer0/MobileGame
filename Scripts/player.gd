extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
#Fireball Instance
const FIREBALL = preload("res://Scenes/fireball.tscn")

#Fireball marker
@onready var marker_3d = $Marker3D

@onready var player = $"."

func _physics_process(delta: float) -> void:

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if Input.is_action_just_pressed("ui_accept"):
		_shoot_fireball()
	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
		

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

func _shoot_fireball():
	var fireball_node = FIREBALL.instantiate() 
	get_parent().add_child(fireball_node)
	fireball_node.global_position = marker_3d.global_position
