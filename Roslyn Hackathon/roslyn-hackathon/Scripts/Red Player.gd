extends CharacterBody2D

var characterNum = 0
var home = false
var DuckArt = ["res://Art/Black Duck (Still).png", "res://Art/Bufflehead (Still).png","res://Art/Wood Duck (Still).png"]
var hasEgg = false
var speeds = [400.0, 300.0, 200.0]
var health = 3

@onready var Acorn = preload("res://Scenes/red_acorn.tscn")


func _ready():
	print("start")
	pass # Replace with function body.

func _process(delta):
	if hasEgg: 
		$Egg.show()
	else:
		$Egg.hide()

	if Input.is_action_just_pressed("Red Swap"):
		if(home):
			characterNum = (characterNum + 1) % 3
			$Sprite2D.texture = load(DuckArt[characterNum])
	pass



func _physics_process(delta):
	var direction := Vector2.ZERO
	
	var speed = speeds[characterNum]
	
	if hasEgg:
		speed = speeds[characterNum] * .75
		
	
	
	
	if Input.is_action_pressed("Red Left"):
		$Sprite2D.flip_h = false
		direction.x -= 1
	if Input.is_action_pressed("Red Right"):
		$Sprite2D.flip_h = true
		direction.x += 1
	if Input.is_action_pressed("Red Up"):
		direction.y -= 1
	if Input.is_action_pressed("Red Down"):
		direction.y += 1

	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("Red Attack"):
		spawn_projectile()




func homeEntered(body):
	#print("func")
	if (body == self):
		home = true
		if hasEgg:
			%"Red Nest".numEggs += 1
			hasEgg = false

		#print("works!")

func homeExited(body):
	if (body == self):
		home = false


func stealEgg(body):
	if(body == self):
		%"Blue Nest".numEggs -= 1 
		hasEgg = true
		pass
		
		
		
		
func spawn_projectile():
	

	var p = Acorn.instantiate()
	p.global_position = global_position + Vector2(0, 200)
	p.direction = velocity.normalized()
	p.target_node = get_node("/root/Scene/Functionality/Blue Player")

	get_tree().current_scene.add_child(p)
	
	
	
func hit(body):
	if body == self:
		health -= 1
		self.x = -379
		self.y = 98
		#add 5 second timeout if you have time
			
