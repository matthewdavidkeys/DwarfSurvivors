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
		#direction of enemy
		var direction = targetSelector.direction
		var angle_offset = 0.2
		if (fireDelayTimer.is_stopped()):
			var angle = atan2(direction.y, direction.x)
			print(angle)
			print("OFFSET:")
			print(angle + angle_offset)
			fireDelayTimer.start(fire_delay)
			#1st bullet - middle
			projectileShooter.shoot_at(direction)
			#2nd bullet - top
			projectileShooter.shoot_at(direction.rotated(angle_offset))
