extends Node2D

@onready var fireDelayTimer : Timer = $FireDelayTimer
@onready var targetSelector : TargetSelector = $TargetSelector
@onready var sprite : Sprite2D = $Sprite2D
@onready var projectileShooter : ProjectileShooter = $ProjectileShooter

@export var stats : Resource
var fire_delay: float = 0.6
var angle_offset = 0.2

func _ready():
	fire_delay = stats.fire_delay
	angle_offset = stats.angle_offset

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
		
