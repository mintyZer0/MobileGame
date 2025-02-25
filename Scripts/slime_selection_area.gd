extends Area3D

@onready var character_selection_scene = get_tree().get_root().get_node("CharacterSelection")
@onready var slime = get_parent()
#Get slime name bug append _player to refer to the slime player scenes
@onready var slime_name = slime.scene_file_path.get_file().get_basename() + "_player"
@onready var characters_selected = CharacterSelectData.characters_selected
signal character_selected
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#connect signal to characte selection screen node function called character_selected
	character_selected.connect(character_selection_scene.character_selected)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_action_pressed("pressed"):
		print(len(characters_selected))
		if slime_name not in characters_selected.values():
			if len(characters_selected) < 3:
				add_character()
		elif slime_name in characters_selected.values():
			remove_character()

func add_character():
	#emit signal named character_selected and return slime.name
	#add slime if slime_name not in dict
		emit_signal("character_selected", slime.name)
		if characters_selected.size() == 0:
			characters_selected["MiddleSlime"] = slime_name
		elif characters_selected.size() == 1:
			characters_selected["LeftSlime"] = slime_name
		elif characters_selected.size() == 2:
			characters_selected["RightSlime"] = slime_name
		$Selection.show()
		print(characters_selected)

func remove_character():
	#remove character is slime_name already in dict
	for key in characters_selected:
		if characters_selected[key] == slime_name:
			characters_selected.erase(key)
	$Selection.hide()
	print(slime.name)
	print(characters_selected)
