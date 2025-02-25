extends Node3D
class_name HealthComponent
@export var full_health = 10
var health : float

func _ready() -> void:
	health = full_health
	
func take_damage(attack: Attack):
	health -= attack.normal_attack_damage
	print(health)
	if health <= 0:
		get_parent().queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
