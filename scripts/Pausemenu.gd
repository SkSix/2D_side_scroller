extends Control

var is_paused=false setget set_is_paused

func _unhandled_input(event): #calling a funcing to create a event for pause
	if event.is_action_pressed("pause"): #using esc buton
		self.is_paused=!is_paused
		$VBoxContainer/resumeB.grab_focus()

func set_is_paused(value): #calling function to pause a scene
	is_paused=value
	get_tree().paused=is_paused
	visible=is_paused

func _on_resumeB_pressed():
	self.is_paused=false #resuming any scene from pause state

func _on_QuitB_pressed(): 
	get_tree().change_scene("res://Main menu.tscn") #getting back to  main menu

func _on_Button_pressed():
	self.is_paused=!is_paused #pausing any scene
	
func _ready():
	show_arrows_resume()
	hide_arrows_resume()
	show_arrows_quit()
	hide_arrows_quit()
	set_focus_mode(true)
	
func show_arrows_resume():
	$"Button-sword-1".visible=true
func hide_arrows_resume():
	$"Button-sword-1".visible=false
func show_arrows_quit():
	$"Button-sword-2".visible=true
func hide_arrows_quit():
	$"Button-sword-2".visible=false


func _on_resumeB_focus_entered():
	show_arrows_resume()

func _on_resumeB_focus_exited():
	hide_arrows_resume()

func _on_resumeB_mouse_entered():
	show_arrows_resume()

func _on_resumeB_mouse_exited():
	hide_arrows_resume()

func _on_QuitB_focus_entered():
	show_arrows_quit()

func _on_QuitB_focus_exited():
	hide_arrows_quit()

func _on_QuitB_mouse_entered():
	show_arrows_quit()

func _on_QuitB_mouse_exited():
	hide_arrows_quit()
