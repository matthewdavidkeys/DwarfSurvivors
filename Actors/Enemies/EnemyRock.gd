extends CharacterBody2D

var pathfindComponent: PathfindComponent
var velocityComponent: VelocityComponent

var target

func _ready():
	pathfindComponent = get_node("PathfindComponent")
	velocityComponent = get_node("VelocityComponent")
	
	var targets: Array = get_tree().get_nodes_in_group("Player")
	
	if targets.size() > 0:
		target = targets[0]
	
	pathfindComponent.select_target(target)

func _process(delta):
	pathfindComponent.follow_target()
	velocityComponent.move(self)
