extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _unhandled_input(event): #stops users to quit the game directly by using close window option
	get_tree().set_quit_on_go_back(false) 
	get_tree().set_auto_accept_quit(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
