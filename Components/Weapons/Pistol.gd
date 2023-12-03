extends Node2D

@onready var fireDelayTimer := $FireDelayTimer
@onready var targetSelector = $TargetSelector
@onready var sprite = $Sprite2D
@onready var projectileShooter = $ProjectileShooter

@export var stats : Resource
var fire_delay: float

func _ready():
	fire_delay = stats.fire_delay

func _process(delta):
	#target nearest enemy
	targetSelector.select_and_track()
	
	#look at target and fire
	if (targetSelector.target):
		sprite.look_at(targetSelector.direction)
		if (fireDelayTimer.is_stopped()):
			fireDelayTimer.start(fire_delay)
			var direction = (targetSelector.direction - global_position).normalized()
			projectileShooter.shoot_at(direction)
