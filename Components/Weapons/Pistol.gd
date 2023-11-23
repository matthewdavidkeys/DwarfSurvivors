extends Node2D

var targetSelector: TargetSelector
var sprite: Sprite2D
var firingMechanism: FiringMechanism

func _ready():
	targetSelector = get_node("TargetSelector")
	sprite = get_node("Sprite2D")
	firingMechanism = get_node("FiringMechanism")

func _process(delta):
	targetSelector.select_and_track()
	if (targetSelector.target):
		sprite.look_at(targetSelector.direction)
	firingMechanism.shoot()
