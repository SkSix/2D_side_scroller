extends Control

var is_paused=false setget set_is_paused
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _on_Button_pressed():
	self.is_paused=!is_paused

func set_is_paused(value):
	is_paused=value
	get_tree().paused=is_paused
	visible=is_paused

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
