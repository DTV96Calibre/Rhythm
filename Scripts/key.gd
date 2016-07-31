
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
export var beat = 0;
export var key  = "key1";
export var debug = true;
var pressed = false;
var press_time = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)

func _process(delta):
	press_time += delta

func _input(event):
	if event.is_action_released(key):
		get_node("AnimatedSprite").set_beat(0)
		pressed = false
		set_process(false)
		press_time = 0
		if debug:
			print(get_node("AnimatedSprite").get_beat())
	if event.is_action_pressed(key):
		get_node("AnimatedSprite").set_beat(1)
		pressed = true
		set_process(true)
		if debug:
			print(get_node("AnimatedSprite").get_beat())

func get_key_is_pressed():
	return pressed

func get_key_press_time():
	return press_time
