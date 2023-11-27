extends Area2D
class_name HurtboxComponent

@export var healthComponent : HealthComponent

func _ready():
	self.area_entered.connect(_on_area_entered)

func handleBulletCollision(bullet: Bullet) -> void:
	var damage = bullet.damage
	handleDamage(damage)
	
func handleDamage(damage: float):
	healthComponent.damage(damage)
	
func handleHitboxCollision(hitbox: HitboxComponent) -> void:
	print("HITBOX HIT")

func _on_area_entered(area : Area2D):
	if area is HitboxComponent:
		print("other side")
