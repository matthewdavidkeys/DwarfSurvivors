extends CharacterBody2D

var pathfindComponent: PathfindComponent
var velocityComponent: VelocityComponent
var healthComponent: HealthComponent

var target

func _ready():
	pathfindComponent = get_node("PathfindComponent")
	velocityComponent = get_node("VelocityComponent")
	healthComponent = get_node("HealthComponent")
	
	#target player 
	var targets: Array = get_tree().get_nodes_in_group("Player")
	if targets.size() > 0:
		target = targets[0]
	pathfindComponent.select_target(target)
	
	### connect signals ###
	
	#health zero -> kill enemy
	healthComponent.health_zero.connect(die)

func _physics_process(delta):
	pathfindComponent.follow_target()
	velocityComponent.move(self)
	

func die():
	queue_free()
