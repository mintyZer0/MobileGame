extends Area3D

@export var speed = 10
@export var damage = 200
@onready var dir = +get_tree().get_first_node_in_group("player").global_transform.basis.z.normalized()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#add_to_group("player")
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var dir = -get_tree().get_first_node_in_group("player").global_transform.basis.z.normalized()
	global_position += dir * speed * delta


func _on_body_entered(body: Node3D) -> void:
	queue_free()
