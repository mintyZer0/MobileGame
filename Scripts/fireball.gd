extends Area3D

@export var speed = 10
@export var normal_attack_damage = 1
@onready var dir = get_tree().get_first_node_in_group("player").global_transform.basis.x.normalized()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#add_to_group("player")
	var timer = $Timer
	timer.timeout.connect(_on_timer_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var dir = -get_tree().get_first_node_in_group("player").global_transform.basis.z.normalized()
	global_position += dir * speed * delta



#deletes fireball after 5s if enemy not hit to save memory
func _on_timer_timeout() -> void:
	queue_free()


func _on_area_entered(area: Area3D) -> void:
	if area is HitboxComponent:
		var hitbox : HitboxComponent = area
		var attack = Attack.new()
		attack.normal_attack_damage = normal_attack_damage
		hitbox.take_damage(attack)
		queue_free()
	
	
