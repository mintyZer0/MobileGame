extends Node3D

var current_selected_character_name
var selection_area = preload("res://Scenes/selection_area.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	InputManager.connect("single_drag", Callable(self, "_on_single_drag"))
	for character in $Characters.get_children():
		var selection_area_ins = selection_area.instantiate()
		character.add_child(selection_area_ins)

func character_selected(character_name):
	current_selected_character_name = character_name
	$CharacterLabel.text = current_selected_character_name
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_go_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/the_menu.tscn")

#Determine if swipe is left or right then handle swipe direction using function
func _on_single_drag(event):
	var direction = event.relative
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			handle_horizontal_swipe("right", event.strength)
		else:
			handle_horizontal_swipe("left", event.strength)
			
#Moves the camera depending on the direction of the swipe
func handle_horizontal_swipe(direction, strength):
	var camera = $Camera3D
	var drag_sensitivity = strength * 0.2
	if direction == "right":
		camera.translate(Vector3(-1*drag_sensitivity,0,0))
	elif direction == "left":
		camera.translate(Vector3(drag_sensitivity,0,0))
