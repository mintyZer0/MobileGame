extends CharacterBody3D


const SPEED = 1.0
var start_position
var direction  = 1

func _process(delta: float) -> void:
	start_position = global_transform.origin.z  


func _physics_process(delta: float) -> void:
	global_transform.origin.z += SPEED * direction * delta
	
	
	move_and_slide()
