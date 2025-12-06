extends Area2D

var activated = false
var growth_rate = .1
var timer := Timer.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	#add_child(timer)
	#timer.wait_time = 2.0
	#timer.one_shot = true
	#timer.timeout.connect(on_timeout)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Blue Attack") && %"Blue Player".characterNum == 0:
		self.show()
		print("hello")
		activated = true
		#timer.start()
		pass
		
		
		if activated:
			scale += Vector2(growth_rate, growth_rate) * delta
			pass
	pass
	
	
	
func on_timeout():
	self.scale.x = .5
	self.scale.y = .5
	self.hide()
	activated = false
	
	pass


		
