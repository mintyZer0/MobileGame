extends Node3D

@export var modules: Array[PackedScene] = []
var amount = 100
var rng = RandomNumberGenerator.new()
var offset = 5

func _ready():
	for n in amount:
		spawnModule(n*offset)

func spawnModule(n):
	rng.randomize()
	var num = rng.randi_range(0, modules.size()-1)
	var instance = modules[num].instantiate()
	instance.position.z = n
	add_child(instance)
