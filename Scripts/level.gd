extends Node3D

@export var modules: Array[PackedScene] = []
var amount = 10
var rng = RandomNumberGenerator.new()
var offset = 5

func _ready():
	for n in amount:
		if n < 10:
			spawnEmptyModule(n*offset)
			continue
		spawnModule(n*offset)
		print(n)
		
#Spawns empty module in the beginning so that you dont die immediately
func spawnEmptyModule(n):
	var empty_module = modules[0].instantiate()
	print(n)
	empty_module.position.z = n
	add_child(empty_module)

func spawnModule(n):
	rng.randomize()
	var num = rng.randi_range(0, modules.size()-1)
	var instance = modules[num].instantiate()
	instance.position.z = n
	add_child(instance)
