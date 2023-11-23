extends CharacterBody2D

#variables that can be set in editor
@export var speed = 400 #speed of player
var screen_size #size of game window

func _ready():
	screen_size = get_viewport_rect().size

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
func _physics_process(delta):
	get_input()
	move_and_slide()
	position = position.clamp(Vector2.ZERO, screen_size)
