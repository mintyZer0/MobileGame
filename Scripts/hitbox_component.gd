extends Area3D
class_name HitboxComponent
@export var health_component: HealthComponent
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func take_damage(attack: Attack):
	if health_component:
		health_component.take_damage(attack)
		
