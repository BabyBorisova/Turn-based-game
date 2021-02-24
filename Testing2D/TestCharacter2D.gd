extends Sprite
signal turn_ended
var AP = 10

func _ready():
	self.connect("turn_ended",get_tree().get_root().get_child(0), "on_turn_ended")


func play_turn():
	print("Start turn")
	set_process(true)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		AP -= 1
		print("Your AP is: " + AP as String)
	if AP == 0:
		emit_signal("turn_ended")
		set_process(false)
