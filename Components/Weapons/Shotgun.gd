extends Node2D

var targetSelector: TargetSelector
var sprite: Sprite2D

func _ready():
	targetSelector = get_node("TargetSelector")
	sprite = get_node("Sprite2D")

func _process(delta):
	targetSelector.select_and_track()
	if (targetSelector.target):
		sprite.look_at(targetSelector.direction)
