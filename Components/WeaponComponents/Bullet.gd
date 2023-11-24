extends Area2D
class_name Bullet

var speed := 200
var direction = Vector2.ZERO
var damage

func _process(delta):
	position += direction * speed * delta

func _on_Bullet_area_entered(area : Area2D):
	if area is HurtboxComponent:
		area.handleBulletCollision(self)
		queue_free()
