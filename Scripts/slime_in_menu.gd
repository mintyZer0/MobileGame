extends RigidBody3D

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		#add animations like slime bouncing or wiggling or whatever laterr
		#or maybe the current active slime to be used is what's in here
		print("you clicked")
