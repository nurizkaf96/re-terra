extends Node2D
class_name PlayerInput

var controls = {"eco_up": [KEY_UP],
				"eco_left": [KEY_LEFT],
				"eco_down": [KEY_DOWN],
				"eco_right": [KEY_RIGHT],
				
				"eng_up": [KEY_W],
				"eng_left": [KEY_A],
				"eng_down": [KEY_S],
				"eng_right": [KEY_D],
				
				"dis_up": [KEY_T],
				"dis_left": [KEY_F],
				"dis_down": [KEY_G],
				"dis_right": [KEY_H],
				
				"exp_up": [KEY_I],
				"exp_left": [KEY_J],
				"exp_down": [KEY_K],
				"exp_right": [KEY_L]
				
				}

func _ready():
	add_inputs()

func add_inputs():
	var ev
	for action in controls:
		if not InputMap.has_action(action):
			InputMap.add_action(action)
		for key in controls[action]:
			ev = InputEventKey.new()
			ev.scancode = key
			InputMap.action_add_event(action, ev)
