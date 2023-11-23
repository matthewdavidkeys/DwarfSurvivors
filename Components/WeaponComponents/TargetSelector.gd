extends Node2D
class_name TargetSelector

@export var rangeCollider: Area2D

var target
var direction

#set collision so that gun looks only at enemies
func _ready():
	rangeCollider.set_collision_mask_value(3, true)

func select_and_track():
	target = find_closest_enemy()
	direction = get_direction() 

#find closest enemy of all enemies in range
func find_closest_enemy():
	var overlapping_bodies = rangeCollider.get_overlapping_bodies()
	
	var closest_enemy = null
	var closest_distance = float(INF)

	for body in overlapping_bodies:
		if body.is_in_group("Enemy"):
			var distance = rangeCollider.global_position.distance_to(body.global_position)
			
			if distance < closest_distance:
				closest_distance = distance
				closest_enemy = body
				
	return closest_enemy
	
func get_direction():
	if (target):
		#return (target.global_position - self.global_position).normalized()
		return target.global_position
	
