extends Player

signal collided

func _physics_process(delta: float) -> void:
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision:
			emit_signal('collided', collision)
