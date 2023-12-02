extends Node2D

var targetSelector: TargetSelector
var sprite: Sprite2D
var projectileShooter: ProjectileShooter

@onready var fireDelayTimer := $FireDelayTimer
@export var fire_delay: float = 0.6
@export var angle_offset = 0.7

func _ready():
	targetSelector = get_node("TargetSelector")
	sprite = get_node("Sprite2D")
	projectileShooter = get_node("ProjectileShooter")

func _physics_process(delta):
	#target nearest enemy
	targetSelector.select_and_track()
	
	#look at target and fire
	if (targetSelector.target):
		sprite.look_at(targetSelector.direction)
		#direction of enemy
		var direction = (targetSelector.direction - global_position).normalized()
		if (fireDelayTimer.is_stopped()):
			fireDelayTimer.start(fire_delay)
			#1st bullet - middle
			projectileShooter.shoot_at(direction)
			#2nd bullet - top
			projectileShooter.shoot_at(direction.rotated(angle_offset))
			#3rd bullet - bottom
			projectileShooter.shoot_at(direction.rotated(-angle_offset))
		
