extends CanvasLayer
var isPaused = false

func _on_resume_pressed() -> void:
	isPaused = !isPaused
	get_tree().paused = isPaused
	$PauseMenu.hide()

func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/the_menu.tscn")

func _ready() -> void:
	$PauseMenu.hide()

func _on_pause_button_pressed() -> void:
	isPaused = !isPaused
	get_tree().paused = isPaused
	$PauseMenu.visible = isPaused
