
export var beat = 0

func _init():
	print("Constructed!")
	
func set_beat(x):
	beat = x
	self.set_frame(x)
	
func get_beat():
	return beat