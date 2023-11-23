extends Node2D
class_name PathfindComponent

var selected_target: CharacterBody2D
@export var velocity_component: VelocityComponent

# select the target given
func select_target(target: CharacterBody2D):
	selected_target = target

func follow_target():
	var target_position = selected_target.global_position
	var difference = (target_position - self.global_position).normalized()
	velocity_component.accelerate_in_direction(difference)
