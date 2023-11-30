extends TextureProgressBar

@export var player: Player

var max_health

func _ready():
	#connect signal for when health changes
	player.healthComponent.health_changed.connect(update_bar)
	max_health = player.healthComponent.max_health
	update_bar()

func update_bar():
	max_value = max_health
	value = player.healthComponent.current_health
