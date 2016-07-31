# The note should move until collision with key and key is pressed.
# The position of the key should be compared to the position of the note and the delta should be used 
# to determine the quality of the hit




extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
export var velocity = 500
export var debug = false
var time = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	if debug:
		print("Note initialized at ", self.get_pos())

func _process(delta):
	self.set_pos(Vector2(self.get_pos().x, self.get_pos().y + delta * velocity))
	time += delta
	if time > 1 and debug:
		print(self.get_pos().y)
		time = 0
