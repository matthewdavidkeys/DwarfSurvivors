extends Node2D
class_name EnemySpawner

@onready var tileMap : TileMap = get_node("../../TileMap")
var spawn_area : Rect2
	
func get_spawn_area():
	var array = tileMap.get_used_cells(0)
	var top_left = tileMap.map_to_local(array[0])
	var bottom_right = tileMap.map_to_local(array[-1])
	var size = bottom_right - top_left
	spawn_area = Rect2(top_left, size)

func choose_random_spawn_location() -> Vector2:
	var pos = spawn_area.position
	var size = spawn_area.size
	var random_location = Vector2(randf_range(pos.x, pos.x + size.x), randf_range(pos.y, pos.y + size.y))
	return random_location
	
func spawn_enemy(location : Vector2, enemy : PackedScene):
	var enemy_instance = enemy.instantiate()
	enemy_instance.global_position = location
	get_tree().get_root().add_child(enemy_instance)
