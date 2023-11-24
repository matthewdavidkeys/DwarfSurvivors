extends Node2D
class_name ProjectileShooter

@export var bulletScene: PackedScene
@export var fire_delay: float = 0.6
@export var bullet_speed = 1000
@export var bullet_damage: float = 5

@onready var fireDelayTimer := $FireDelayTimer

func shoot_at(direction: Vector2):
	var bullet = bulletScene.instantiate()
	var level_root = get_tree().get_root()
	level_root.add_child(bullet)
	set_bullet_properties(bullet, direction)

func set_bullet_properties(bullet: Bullet, direction: Vector2):
	bullet.speed = bullet_speed
	bullet.global_position = self.global_position
	bullet.direction = direction
	bullet.rotation = bullet.direction.angle() + PI/2
	bullet.damage = bullet_damage
