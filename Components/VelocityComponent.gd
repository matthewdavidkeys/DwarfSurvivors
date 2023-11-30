extends Node2D
class_name VelocityComponent

@export var max_speed = 300
@export var slowdown_speed = 30
@export var accel_coef = 10
@onready var current_speed : float = max_speed

var velocity: Vector2

func accelerate_in_direction(direction: Vector2):
	velocity = direction * current_speed

func move(character: CharacterBody2D):
	character.velocity = velocity
	character.move_and_slide()
	
func set_speed(speed: float):
	current_speed = speed
