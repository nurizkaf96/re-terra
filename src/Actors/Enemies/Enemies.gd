extends 'res://src/Actors/0_Actor.gd'

func _physics_process(delta: float) -> void:
	if is_on_wall():
		_velocity.x *= -1

