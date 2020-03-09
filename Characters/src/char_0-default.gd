extends PlayerInput
class_name CharactersSetting

var speed = 64
var tile_size = 16

var last_position = Vector2()
var target_position = Vector2()
var movedir = Vector2()

export var id_char = ""

onready var ray = $RayCast2D 

func _ready():
	position = position.snapped(Vector2(tile_size, tile_size))
	last_position = position
	target_position = position

func _process(delta: float):
	
	# MOVEMENT
	if ray.is_colliding():
		position = last_position
		target_position = last_position
	else: 
		position += speed * movedir * delta
		
		if position.distance_to(last_position) >= tile_size - speed * delta:
			position = target_position
	
	# IDLE
	if position == target_position:
		get_movedir()
		last_position = position
		target_position += movedir * tile_size

func get_movedir():
	
	var LEFT = Input.is_action_pressed('%s_left' % id_char)
	var RIGHT = Input.is_action_pressed('%s_right' % id_char)
	var UP = Input.is_action_pressed('%s_up' % id_char)
	var DOWN = Input.is_action_pressed('%s_down' % id_char)
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	
	if movedir.x != 0 && movedir.y != 0:
		movedir = Vector2.ZERO
	
	if movedir != Vector2.ZERO: 
		ray.cast_to = movedir * tile_size / 2
	
	update_look_direction(movedir)

func update_look_direction(direction):
	$Pivot/Sprite.rotation = direction.angle()
