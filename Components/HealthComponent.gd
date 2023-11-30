extends Node2D
class_name HealthComponent

@export var max_health : float = 10

@onready var current_health = max_health : set = _set_current_health

signal health_zero
signal health_changed

func _set_current_health(value : float):
	current_health = value
	
	current_health = clamp(current_health, 0, max_health)
	
	emit_signal("health_changed")
	
	#if zero hp
	if current_health <= 0:
		emit_signal("health_zero")

func damage(damage : float):
	current_health -= damage

func heal(heal : float):
	damage(-heal)
	
func clamp_health():
	current_health = clamp(current_health, 0, max_health)
