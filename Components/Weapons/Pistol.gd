extends Node2D

var targetSelector: TargetSelector
var sprite: Sprite2D
var projectileShooter: ProjectileShooter

@onready var fireDelayTimer := $FireDelayTimer
@export var fire_delay: float = 0.6

func _ready():
	targetSelector = get_node("TargetSelector")
	sprite = get_node("Sprite2D")
	projectileShooter = get_node("ProjectileShooter")

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
