extends Node2D

# Create note from note scene and set it in motion toward the key
var total = 0
var note = preload("res://Note.tscn").instance()

# Ranges for quality of hit note
var perfect = 10
var great = 25
var ok = 75

var emitter_offset = self.get_pos().y

# Window of time where key will be considered triggered
var key_trigger_period = .1

func _ready():
	set_process(true)

func _process(delta):
	# emit note
	total += delta
	if total > 1:
		emit()
		total = 0
	
	# Remember that I haven't caught a note yet
	var caught_note = false
	var child # Children are notes spawned by emitter
	if self.get_child_count() > 0:
		child = get_child(0) 
		var y = child.get_pos().y
		if get_parent().get_key_is_pressed():
			if hit_note(y):
				remove_child(child)
#		if missed_note(y):
#			remove_child(child)
		
func emit():
	var note = preload("res://Note.tscn").instance()
	add_child(note)

func hit_note(y):
	if get_parent().get_key_press_time() > key_trigger_period:
		return false
	if y > (-1 * (perfect + emitter_offset)):
		print("Perfect")
		return true
	elif y > (-1 * (great + emitter_offset)):
		print("Great")
		return true
	elif y > (-1 * (ok + emitter_offset)):
		print("OK")
		return true
	else:
		return false
		print("Miss")

func missed_note(y):
	if y > (ok + emitter_offset):
		return true
	else:
		return false