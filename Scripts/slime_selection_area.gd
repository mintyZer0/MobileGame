extends Area3D

@onready var character_selection_scene = get_tree().get_root().get_node("CharacterSelection")
@onready var slime = get_parent()
signal character_selected
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#connect signal to character selection screen node function called character_selected
	character_selected.connect(character_selection_scene.character_selected)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_action_pressed("pressed"):
			if slime.name not in CharacterSelectData.characters_selected:
				if len(CharacterSelectData.characters_selected) < 4:
					#emit signal named character_selected and return slime.name
					emit_signal("character_selected", slime.name)
					CharacterSelectData.characters_selected.append(slime.name)
					$Selection.show()
					print(slime.name)
					print(CharacterSelectData.characters_selected)
			elif slime.name in CharacterSelectData.characters_selected:
				CharacterSelectData.characters_selected.erase(slime.name)
				$Selection.hide()
				print(slime.name)
				print(CharacterSelectData.characters_selected)
				
		
