extends CharacterBody2D

var characterNum = 0
var home = true
var DuckArt = ["res://Art/Black Duck (Still).png", "res://Art/Bufflehead (Still).png","res://Art/Wood Duck (Still).png"]
var hasEgg = false
var speeds = [400.0, 300.0, 200.0]
var cooldowns = [2, 1 ,.4]
var health = 3

@onready var Acorn = preload("res://Scenes/blue_acorn.tscn")


func _ready():
	print("start")
	pass # Replace with function body.

func _process(delta):
	#attack code
	
	if Input.is_action_just_pressed("Blue Attack"):
		#acorn code
		pass
	
		
	
	
	
	# egg code
	if hasEgg:
		$Egg.show()
	else:
		
		$Egg.hide()
	if Input.is_action_just_pressed("Blue Swap"):
		if(home):
			characterNum = (characterNum + 1) % 3
			$Sprite2D.texture = load(DuckArt[characterNum])
	pass



func _physics_process(delta):
	var direction := Vector2.ZERO
	
	var speed = speeds[characterNum]
	if hasEgg:
		speed = speeds[characterNum] * .75
	
	
	if Input.is_action_pressed("Blue Left"):
		$Sprite2D.flip_h = false
		direction.x -= 1
	if Input.is_action_pressed("Blue Right"):
		$Sprite2D.flip_h = true
		direction.x += 1
	if Input.is_action_pressed("Blue Up"):
		direction.y -= 1
	if Input.is_action_pressed("Blue Down"):
		direction.y += 1

	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
	
	
	if Input.is_action_just_pressed("Blue Attack"):
		spawn_projectile()



func spawn_projectile():
	

	var p = Acorn.instantiate()
	p.global_position = global_position + Vector2(0, 200)
	p.direction = velocity.normalized()
	p.target_node = get_node("/root/Scene/Functionality/Red Player")

	get_tree().current_scene.add_child(p)
	










func homeEntered(body):
	#print("func")
	if (body == self):
		home = true
		if(hasEgg):
			%"Blue Nest".numEggs += 1
			hasEgg = false
		#print("works!")

func homeExited(body):
	if (body == self):
		home = false
		
		
func stealEgg(body):
	if (body == self):
		hasEgg = true
		%"Red Nest".numEggs -= 1
		pass
		
		
func onHit(body):
	if body == self:
		health -= 1
		self.x = -379
		self.y = 98
		#add 5 second timeout if you have time
