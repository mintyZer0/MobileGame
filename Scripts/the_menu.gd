extends CanvasLayer

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/prototype.tscn")

func _on_select_char_button_pressed() -> void:
	get_tree().change_scene_to_file(("res://Scenes/character_selection.tscn"))

func _on_infinite_stage_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/prototype.tscn")

func _on_options_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
