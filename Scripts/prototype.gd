extends Node3D
#Label for points that's on an Hbox container so that it scales on resolution size
@onready var points = get_node("Hud/CanvasLayer/HBoxContainer/Points")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _process(delta: float) -> void:
	points.text = str(Global.points)
	
