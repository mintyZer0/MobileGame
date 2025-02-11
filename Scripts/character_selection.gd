extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	InputManager.connect("single_drag", Callable(self, "_on_single_drag"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_go_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/the_menu.tscn")
	
func _on_single_drag(event):
	var direction = event.relative
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			handle_horizontal_swipe("right", event.strength)
		else:
			handle_horizontal_swipe("left", event.strength)
			
func handle_horizontal_swipe(direction, strength):
	var camera = $Camera3D
	var drag_sensitivity = strength * 0.2
	if direction == "right":
		camera.translate(Vector3(-1*drag_sensitivity,0,0))
	elif direction == "left":
		camera.translate(Vector3(drag_sensitivity,0,0))
