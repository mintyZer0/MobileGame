extends Node3D
@onready var module = $"."
@onready var level = $"../"
var speed = 6

func _process(delta: float) -> void:
	#print(module.position.z)
	position.z -= speed * delta
	if position.z < -15:
		#Spawns infinite modules after removing module
		#level.spawnModule(position.z+(level.amount*level.offset))
		queue_free()
