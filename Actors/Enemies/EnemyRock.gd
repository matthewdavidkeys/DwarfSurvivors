extends CharacterBody2D

@onready var pathfindComponent: PathfindComponent = get_node("PathfindComponent")
@onready var velocityComponent: VelocityComponent = get_node("VelocityComponent")
@onready var healthComponent: HealthComponent = get_node("HealthComponent")
@onready var hitboxComponent: HitboxComponent = get_node("HitboxComponent")
@onready var damageTimer: Timer = get_node("DamageTimer")

@export var attack_cooldown = 1.0

var target
var current_hurtbox : HurtboxComponent
var in_hurtbox : bool = false

func _ready():
	#===CONNECT SIGNALS===#
	#health zero -> kill enemy
	healthComponent.health_zero.connect(die)
	
	#hit a hurtbox
	hitboxComponent.hurtbox_hit.connect(hurtbox_hit)
	
	#exited a hurtbox
	hitboxComponent.hurtbox_left.connect(hurtbox_left)
	
	#target player 
	var targets: Array = get_tree().get_nodes_in_group("Player")
	if targets.size() > 0:
		target = targets[0]
	pathfindComponent.select_target(target)

func _physics_process(delta):
	pathfindComponent.follow_target()
	velocityComponent.move(self)
	
	#attack every few seconds while inside
	if in_hurtbox:
		if (damageTimer.is_stopped()):
			damageTimer.start(attack_cooldown)
			current_hurtbox.handleDamage(2)
	
#connected to trigger - enemy's health reached 0
func die():
	queue_free()
	
func hurtbox_hit(hurtbox : HurtboxComponent):
	in_hurtbox = true
	current_hurtbox = hurtbox
	velocityComponent.set_speed(velocityComponent.slowdown_speed)
	
func hurtbox_left(hurtbox : HurtboxComponent):
	in_hurtbox = false
	velocityComponent.set_speed(velocityComponent.max_speed)
