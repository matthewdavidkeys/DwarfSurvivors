extends Area2D
class_name HurtboxComponent

@export var healthComponent : HealthComponent

func handleBulletCollision(bullet: Bullet) -> void:
	var damage = bullet.damage
	handleDamage(damage)
	
func handleDamage(damage: float):
	healthComponent.damage(damage)
