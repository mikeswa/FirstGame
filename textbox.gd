extends TextEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text_changed.connect(_text_caller)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _text_caller():
	print("called")
