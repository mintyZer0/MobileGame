extends Node3D

@onready var level = $"../"
var speed = 6

func _process(delta: float) -> void:
	position.z -= speed * delta
	if position.z < -15:
		level.spawnModule(position.x+(level.amount*level.offset))
		queue_free()
