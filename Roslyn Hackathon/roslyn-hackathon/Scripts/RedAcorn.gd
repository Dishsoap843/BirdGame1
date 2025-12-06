extends Node2D

@export var speed := 300.0
var direction := Vector2.ZERO
var teleport_position = Vector2(513, -295)
var target_node: Node = null

func _ready():
	$Acorn.body_entered.connect(_on_body_entered)
	
func _physics_process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	# Only teleport if we hit the right node
	if body == target_node:
		body.global_position = teleport_position
		queue_free()
