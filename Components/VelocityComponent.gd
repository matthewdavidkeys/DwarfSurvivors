extends Node2D
class_name VelocityComponent

@export var max_speed = 300
@export var accel_coef = 10

var velocity: Vector2

func accelerate_in_direction(direction: Vector2):
	velocity = direction * max_speed

func move(character: CharacterBody2D):
	character.velocity = velocity
	character.move_and_slide()
