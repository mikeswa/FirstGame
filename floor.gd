extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$TimerLabel.visible = false
	$Button.pressed.connect(_button_pressed)
	$Countdown.timeout.connect(_timer_stopped)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var timeLeft = $Countdown.get_time_left()
	$TimerLabel.text = "%01d" % timeLeft

# Called on button press
func _button_pressed():
	$Countdown.start(5)
	$Button.visible = false
	$TimerLabel.visible = true
	print("Timer Starting")

func _timer_stopped():
	$Countdown.stop()
	$Button.visible = true
	$TimerLabel.visible = false
	print("Timer Stopped")
