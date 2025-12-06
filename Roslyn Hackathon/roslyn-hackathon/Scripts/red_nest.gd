extends Node2D

var numEggs = 3
var redText
# Called when the node enters the scene tree for the first time.
func _ready():
	redText = %"Red Egg Count"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	redText.text = "Red Nest: " + str(numEggs) + " Eggs"
	if numEggs >= 5: 
		%"Red Winner Text".show()
		get_tree().paused = true 
		
