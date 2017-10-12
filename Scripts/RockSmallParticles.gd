extends Particles2D

var timer = Timer.new()

func _ready():
	timer.set_wait_time(5)
	timer.start()
	timer.set_one_shot(true)
	timer.connect("timeout", self, "_destroy")
	add_child(timer)
	
	set_emitting(true)
	set_process(true)
	
func _destroy():
	queue_free()
