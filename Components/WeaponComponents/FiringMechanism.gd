extends Node2D
class_name FiringMechanism

@export var bulletScene: PackedScene
@export var targetSelector: TargetSelector
@export var fire_delay: float = 0.6
@export var bullet_speed = 1000

@onready var fireDelayTimer := $FireDelayTimer

func shoot():
	#if shoot delay is done and we have a target
	if (fireDelayTimer.is_stopped() and targetSelector.target):
		fireDelayTimer.start(fire_delay)
		var bullet = bulletScene.instantiate()
		var level_root = get_tree().get_root()
		level_root.add_child(bullet)
		set_bullet_properties(bullet)

func set_bullet_properties(bullet: Bullet):
	bullet.speed = bullet_speed
	bullet.global_position = self.global_position
	bullet.direction = (targetSelector.direction - global_position).normalized()
	bullet.rotation = bullet.direction.angle() + PI/2
