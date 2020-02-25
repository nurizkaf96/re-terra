extends Node2D

var collision_pos = []

func _on_Ecologist_collided(collision):
	# KinematicCollision2D object emitted by character
	if collision.collider is TileMap:
		var tile_pos = collision.collider.world_to_map($Ecologist.position)
		tile_pos -= collision.normal  # Colliding tile
		var tile = collision.collider.get_cellv(tile_pos)
		if tile > 0  and Input.is_action_just_pressed("eco_x") :
			$Tile_Game.set_cellv(tile_pos, tile-1)

func _on_Engineer_collided(collision):
	# KinematicCollision2D object emitted by character
	if collision.collider is TileMap:
		var tile_pos = collision.collider.world_to_map($Engineer.position)
		tile_pos -= collision.normal  # Colliding tile
		var tile = collision.collider.get_cellv(tile_pos)
		if tile > 0  and Input.is_action_just_pressed("eng_x") :
			$Tile_Game.set_cellv(tile_pos, tile-1)

func _on_Explorer_collided(collision):
	# KinematicCollision2D object emitted by character
	if collision.collider is TileMap:
		var tile_pos = collision.collider.world_to_map($Explorer.position)
		tile_pos -= collision.normal  # Colliding tile
		var tile = collision.collider.get_cellv(tile_pos)
		if tile > 0  and Input.is_action_just_pressed("exp_x") :
			$Tile_Game.set_cellv(tile_pos, tile-1)

func _on_Dispatcher_collided(collision):
	# KinematicCollision2D object emitted by character
	if collision.collider is TileMap:
		var tile_pos = collision.collider.world_to_map($Dispatcher.position)
		tile_pos -= collision.normal  # Colliding tile
		var tile = collision.collider.get_cellv(tile_pos)
		if tile > 0  and Input.is_action_just_pressed("dis_x") :
			$Tile_Game.set_cellv(tile_pos, tile-1)
