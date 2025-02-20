extends Node3D

@export var state : bool # True if op is + or *, false if - or ÷
@onready var buff := $Detector/Buff
@onready var debuff := $Detector/Debuff
@onready var wallText := $WallText
var posOp = ["+","X"]
var negOp = ["-", "÷"]
var numArr = [1, 2, 3, 4, 5] # Keeping this low for performance reasons. Probably need to lower it in the future too.
var number 
var operation


func _ready() -> void:
	if state:
		operation = posOp[randi() % posOp.size()]
	else:
		operation = negOp[randi() % negOp.size()]
	number = numArr[randi() % numArr.size()]
	wallText.text = operation + str(number) 
	color_picker()

func _on_detector_body_entered(_body: Node3D) -> void:
	num_effect()
	#if Global.playerVal <= 0:
		#get_tree().quit()
	

# playerVal keeps resetting back to 1 instead of retaining current value
func num_effect():
	match (operation):
		"+":
			Global.playerVal += number
			#print(Global.playerVal)
			#return playerVal
		"-":
			Global.playerVal -= number
			#print(Global.playerVal)
			#return playerVal
		"÷":
			Global.playerVal /= number
			#print(Global.playerVal)
			#return playerVal
		"X":
			Global.playerVal *= number
			#print(Global.playerVal)
			#return playerVal
		_:
			print("Idk what to put here")

func color_picker():
	if state:
		buff.visible = true
		debuff.visible = false
	else:
		buff.visible = false
		debuff.visible = true


func _on_detector_body_exited(body: Node3D) -> void:
	pass # Replace with function body.
