extends TextureProgressBar

#@export var player: Player

var player
var max_health

func _ready():
	#connect signal for when health changes
	player = get_node("/root/main/Player")
	player.healthComponent.health_changed.connect(update_health_bar)
	print("signal connected")
	max_health = player.healthComponent.max_health
	update_health_bar(max_health)

func update_health_bar(current_health : float):
	max_value = max_health
	value = current_health
