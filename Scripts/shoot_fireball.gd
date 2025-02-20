extends Node
const FIREBALL = preload("res://Scenes/fireball.tscn")
@export var projInterval = 0.5
@onready var marker_3d = $"../Marker3D"
var gameDone :bool


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while !gameDone:
		call_deferred("_shoot_fireball")
		await get_tree().create_timer(projInterval).timeout

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _shoot_fireball():
	var fireball_node = FIREBALL.instantiate() 
	get_parent().get_parent().add_child(fireball_node)
	print(marker_3d)
	fireball_node.global_position = marker_3d.global_position
