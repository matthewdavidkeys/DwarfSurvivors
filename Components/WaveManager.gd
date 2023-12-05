extends Node2D

@onready var enemySpawner : EnemySpawner = $EnemySpawner
@onready var spawnTimer : Timer = $SpawnTimer
@onready var waveTimer : Timer = $WaveTimer

var enemyRock = preload("res://Actors/Enemies/EnemyRock.tscn")

const wave_interval = 5

var wave_duration : float = 5
var current_wave : int = 1

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
	increase_wave()
	reset_wave()
	
func increase_wave():
	current_wave += 1
	print("Wave", current_wave)
	emit_signal("wave_changed", current_wave)
	
func reset_wave():
	wave_duration += wave_interval
	waveTimer.stop()
	start_wave_timer()

func _process(delta):
	if spawnTimer.is_stopped():
		var location : Vector2 = enemySpawner.choose_random_spawn_location()
		enemySpawner.spawn_enemy(location, enemyRock)
		spawnTimer.start()
