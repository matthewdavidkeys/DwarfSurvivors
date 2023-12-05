extends CanvasLayer

@onready var waveLabel := $WaveLabel
var player
var waveManager

func _ready():
	player = get_node("/root/main/Player")
	waveManager = get_node("/root/main/WaveManager")
	#CONNECT SIGNALS
	waveManager.wave_changed.connect(update_wave_label)
	
	
func update_wave_label(wave : int):
	print("WAVE CHANGED")
	waveLabel.text = "Wave " + str(wave)
