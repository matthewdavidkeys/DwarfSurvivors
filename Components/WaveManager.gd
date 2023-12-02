extends Node2D

@onready var enemySpawner : EnemySpawner = $EnemySpawner
@onready var spawnTimer : Timer = $SpawnTimer
var enemyRock = preload("res://Actors/Enemies/EnemyRock.tscn")
func _ready():
	enemySpawner.get_spawn_area()

func _process(delta):
	if spawnTimer.is_stopped():
		var location : Vector2 = enemySpawner.choose_random_spawn_location()
		print(location)
		enemySpawner.spawn_enemy(location, enemyRock)
		spawnTimer.start()
