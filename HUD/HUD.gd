extends CanvasLayer

@onready var waveLabel := $WaveLabel
@onready var waveTimerLabel := $WaveTimerLabel

var player : Player
var waveManager : WaveManager

var lastDisplayedTime : int = -1

func _ready():
	player = get_node("/root/main/Player")
	waveManager = get_node("/root/main/WaveManager")
	#CONNECT SIGNALS
	waveManager.wave_changed.connect(update_wave_label)
	
	
func update_wave_label(wave : int):
	print("WAVE CHANGED")
	waveLabel.text = "Wave " + str(wave)

func _process(delta):
	var timeLeft = waveManager.waveTimer.time_left
	var roundedTime = floor(timeLeft)
	if roundedTime != lastDisplayedTime:
		waveTimerLabel.text = str(roundedTime)
		lastDisplayedTime = roundedTime
