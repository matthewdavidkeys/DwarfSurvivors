extends CharacterBody2D

@onready var pathfindComponent: PathfindComponent = get_node("PathfindComponent")
@onready var velocityComponent: VelocityComponent = get_node("VelocityComponent")
@onready var healthComponent: HealthComponent = get_node("HealthComponent")

var target

func _ready():
	#===CONNECT SIGNALS===#
	#health zero -> kill enemy
	healthComponent.health_zero.connect(die)
	
	#target player 
	var targets: Array = get_tree().get_nodes_in_group("Player")
	if targets.size() > 0:
		target = targets[0]
	pathfindComponent.select_target(target)

func _physics_process(delta):
	pathfindComponent.follow_target()
	velocityComponent.move(self)
	

func die():
	queue_free()
