# This script centers this script's parent node relative to the viewport.


extends Node

var screen_size
var x
var y

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	center_node(self)
	set_process(true)
	
func _process(delta):
	# Called by the gameloop over and over
	# Updates the node's position if the viewport changed
	if screen_size != get_viewport_rect().size:
		print("This is the screen size ", screen_size)
		print("This is the viewport size ", get_viewport_rect().size)
		_ready()

func center_node(node):
	var x
	var y
	
	screen_size = node.get_viewport_rect().size
	print(screen_size.x)
	print(screen_size.y)
	x = screen_size.x / 2
	y = screen_size.y / 2
	node.set_pos(Vector2(x, y))