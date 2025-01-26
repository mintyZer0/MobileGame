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
var playerVal = 1

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

# playerVal keeps resetting back to 1 instead of retaining current value
func num_effect():
	match (operation):
		"+":
			playerVal += number
			print(playerVal)
		"-":
			playerVal -= number
			print(playerVal)
		"÷":
			playerVal /= number
			print(playerVal)
		"X":
			playerVal *= number
			print(playerVal)
		_:
			print("Idk what to put here")

func color_picker():
	if state:
		buff.visible = true
		debuff.visible = false
	else:
		buff.visible = false
		debuff.visible = true
