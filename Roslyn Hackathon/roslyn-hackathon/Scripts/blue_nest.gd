extends Node2D

var numEggs = 3
var blueText
# Called when the node enters the scene tree for the first time.
func _ready():
	blueText = %"Blue Egg Count"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	blueText.text = "Blue Nest: " + str(numEggs) + " Eggs"
	if(numEggs >= 5):
		%"Blue Winner Text".show()
		get_tree().paused = true 
