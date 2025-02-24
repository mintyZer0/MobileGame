extends Node3D

@export var modules: Array[PackedScene] = []
var amount = 90
var rng = RandomNumberGenerator.new()
var offset = 5
#Get slime spawn points node
@onready var spawn_markers = get_node("../SlimeSpawnMarkers").get_children()
@onready var camera = preload("res://Scenes/player_camera.tscn")

func _ready():
	print(spawn_markers)
	for n in range(amount):
		if n < 10:
			spawnEmptyModule(n*offset)
			continue
		spawnModule(n*offset)
	spawn_slimes()
		
		
		
func spawn_slimes():
	for slime in CharacterSelectData.characters_selected:
		var slime_name = CharacterSelectData.characters_selected[slime]
		var slime_path = load("res://Characters/Character_Players/{file_name}.tscn".format({"file_name":slime_name}))
		var slime_instance = slime_path.instantiate()
		get_tree().get_root().add_child(slime_instance)
		
		
		match slime:
			"MiddleSlime":
				slime_instance.global_position = spawn_markers[0].global_position
				slime_instance.global_rotation_degrees = Vector3(0,-90,0)
				add_camera(slime_instance)
			"LeftSlime":
				slime_instance.global_position = spawn_markers[1].global_position
				slime_instance.global_rotation_degrees = Vector3(0,-90,0)
			"RightSlime":
				slime_instance.global_position = spawn_markers[2].global_position
				slime_instance.global_rotation_degrees = Vector3(0,-90,0)
				
func add_camera(player):
	var camera_instance = camera.instantiate()
	player.add_child(camera_instance)
	camera_instance.current = true
#Spawns empty module in the beginning so that you dont die immediately
func spawnEmptyModule(n):
	var empty_module = modules[0].instantiate()
	empty_module.position.z = abs(-n)
	add_child(empty_module)

func spawnModule(n):
	rng.randomize()
	var num = rng.randi_range(0, modules.size()-1)
	var instance = modules[num].instantiate()
	instance.position.z = abs(-n)
	add_child(instance)
