extends Node2D
class_name EnemySpawner

@onready var tileMap : TileMap = get_node("../../TileMap")
var spawn_area : Rect2
var spawn_marker_delay : float = 1.2
	
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
	
func spawn_enemy(location : Vector2, enemy : PackedScene, spawnMarker : PackedScene):
	var spawn_marker = spawnMarker.instantiate()
	spawn_marker.set_z_index(0)
	spawn_marker.global_position = location
	get_tree().get_root().add_child(spawn_marker)
	
	var spawn_marker_delay_timer : Timer = Timer.new()
	get_tree().get_root().add_child(spawn_marker_delay_timer)
	spawn_marker_delay_timer.one_shot = true
	spawn_marker_delay_timer.timeout.connect(_on_marker_delay_timeout.bind(location, enemy, spawn_marker))
	spawn_marker_delay_timer.start(spawn_marker_delay)
	
	
func _on_marker_delay_timeout(location : Vector2, enemy : PackedScene, spawn_marker):
	spawn_marker.queue_free()
	
	var enemy_instance = enemy.instantiate()
	
	enemy_instance.global_position = location
	enemy_instance.set_z_index(1)
	
	get_tree().get_root().add_child(enemy_instance)
