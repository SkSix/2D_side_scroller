extends Node

var fire_rate=0.2
var clip_size=5
var reloade_rate=1
var current_ammo=clip_size
var can_fire=true
var reloading=false
func _process(delta):
	if Input.is_action_just_pressed("fire") and can_fire:
		if current_ammo>0 and not reloading:
			print("fire")
			can_fire=false
			current_ammo -= 1
			yield(get_tree().create_timer(fire_rate),"timeout")
			can_fire=true
		elif not reloading:
			print("reloading")
			reloading=true
			yield(get_tree().create_timer(reloade_rate),"timeout")
			current_ammo=clip_size
			reloading=false
			print("reload done")
