extends KinematicBody2D
class_name Player

signal energy_changed(newvalue)

export var move_speed := 250.0
export var push_speed := 150.0

export var energy := 100 setget _set_energy

export var id = ""

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('%s_right' % id) :
		velocity.x += 1
	if Input.is_action_pressed('%s_left' % id) :
		velocity.x -= 1
	if Input.is_action_pressed('%s_up' % id) :
		velocity.y -= 1
	if Input.is_action_pressed('%s_down' % id) :
		velocity.y += 1
	velocity = velocity.normalized() * move_speed

func _physics_process(delta: float) -> void:
	get_input()
	
	velocity = move_and_slide(velocity)

func _set_energy (new_value : int) -> void :
	energy = max(0, new_value)
	emit_signal("energy_changed", energy)
