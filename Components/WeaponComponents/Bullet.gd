extends CharacterBody2D
class_name Bullet

var speed := 200
var direction = Vector2.ZERO

func _process(delta):
	move_and_collide(direction * speed * delta)
