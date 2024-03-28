extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$TimerLabel.visible = false
	$TypePrompt.visible = false
	$TypeTimerLabel.visible = false
	
	$StartButton.pressed.connect(_start_button_pressed)
	$Countdown.timeout.connect(_timer_stopped)
	$TypeTimer.timeout.connect(_typetimer_stopped)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var timeLeft = $Countdown.get_time_left() + 1
	$TimerLabel.text = "%01d" % timeLeft
	
	var timeLeftType = $TypeTimer.get_time_left() + 1
	$TypeTimerLabel.text = "%01d" % timeLeftType

# Called on start button press
func _start_button_pressed():
	$Countdown.start(5)
	$StartButton.visible = false
	$TimerLabel.visible = true
	$TypePrompt.visible = true

#called on 1st timer stoppage
func _timer_stopped():
	$Countdown.stop()
	$TimerLabel.visible = false
	#start the typing test timer
	$TypeTimer.start(30)
	$TypeTimerLabel.visible = true
	
#called on typing timer stoppage
func _typetimer_stopped():
	$TypeTimer.stop()
	$StartButton.visible = true
	$TypeTimerLabel.visible = false
	$TypePrompt.visible = false
