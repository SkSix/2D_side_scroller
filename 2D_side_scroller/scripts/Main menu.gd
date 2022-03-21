extends Control

var is_paused=false setget set_is_paused #declaring is_paused as a variable

func set_is_paused(value): #calling function for pause
	is_paused=value
	get_tree().paused=is_paused
	visible=is_paused

func _on_start_pressed():
	get_tree().change_scene("res://Level1.tscn") #on pressing start in menu it will change the scene to level1
	self.is_paused=false #resuming any scene from pause state

func _on_quit_pressed():
	get_tree().quit() #on pressing quit on menu it will quit the game

func _ready():
	show_arrows_new()
	hide_arrows_new()
	show_arrows_quit()
	hide_arrows_quit()
	set_focus_mode(true)
	$VBoxContainer/start.grab_focus()

func show_arrows_new():
	$"Button-sword-1".visible=true
func hide_arrows_new():
	$"Button-sword-1".visible=false
func show_arrows_quit():
	$"Button-sword-2".visible=true
func hide_arrows_quit():
	$"Button-sword-2".visible=false
	
func _on_start_focus_entered():
	show_arrows_new()

func _on_start_focus_exited():
	hide_arrows_new()

func _on_start_mouse_entered():
	show_arrows_new()

func _on_start_mouse_exited():
	hide_arrows_new()
	
func _on_quit_focus_entered():
	show_arrows_quit()

func _on_quit_focus_exited():
	hide_arrows_quit()

func _on_quit_mouse_entered():
	show_arrows_quit()

func _on_quit_mouse_exited():
	hide_arrows_quit()
