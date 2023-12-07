extends Node2D
class_name WaveManager

@onready var enemySpawner : EnemySpawner = $EnemySpawner
@onready var spawnTimer : Timer = $SpawnTimer
@onready var waveTimer : Timer = $WaveTimer

var enemyRock = preload("res://Actors/Enemies/EnemyRock.tscn")
var spawnMarker = preload("res://Components/OtherComponents/SpawnMarker.tscn")

const wave_interval = 5
var wave_duration : float = 6
var current_wave : int = 1
var spawn_delay : int = 3

var spawning_enemies : bool = true

signal wave_changed

func _ready():
	enemySpawner.get_spawn_area()
	waveTimer.timeout.connect(_on_wave_timout)
	emit_signal("wave_changed", current_wave)
	start_wave_timer()
	
func start_wave_timer():
	waveTimer.start(wave_duration)
	print("Wave", current_wave)
	
func _on_wave_timout():
	kill_all_enemies()
	increase_wave()
	reset_wave()
	
func kill_all_enemies():
	get_tree().call_group("Enemy", "die")
	
func increase_wave():
	current_wave += 1
	emit_signal("wave_changed", current_wave)
	
func reset_wave():
	wave_duration += wave_interval
	waveTimer.stop()
	start_wave_timer()
	
func stop_spawning_enemies():
	spawning_enemies = false
	
func start_spawning_enemies():
	spawning_enemies = true
	
func is_spawning_enemies() -> bool:
	return spawning_enemies

func _process(delta):
	if not is_spawning_enemies() && not waveTimer.paused:
		waveTimer.paused = true
		
	if spawnTimer.is_stopped() && is_spawning_enemies():
		spawn_batch_of_enemies(4, enemyRock)
		spawnTimer.start(spawn_delay)
		
func spawn_batch_of_enemies(batch_size : int, enemy : PackedScene):
	for i in batch_size:
		spawn_enemy_random_location(enemy)

func spawn_enemy_random_location(enemy : PackedScene):
	var location : Vector2 = enemySpawner.choose_random_spawn_location()
	enemySpawner.spawn_enemy(location, enemy, spawnMarker)

	
