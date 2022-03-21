extends KinematicBody2D

var velocity=Vector2(0,0) # declaring a variable that will take x axis as input
const STATVEL=180
const STATJUMP=600
const STATGRAVITY=20
const SLASH=60
func _physics_process(delta): #any code below this function will run the code in 60fps in game
	if Input.is_action_pressed("Right"): #character will move right in game
		velocity.x=STATVEL
		$AnimatedSprite.play("run") #trigger run animation
		$AnimatedSprite.flip_h=false
		if Input.is_action_just_pressed("attack"):
			velocity.x=SLASH
			$AnimatedSprite.play("slash")
			
	elif Input.is_action_pressed("Left"): #character will move left in game
		velocity.x=-STATVEL
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h=true
	else:
		$AnimatedSprite.play("idel") #trigger the idel animation
		
	if not is_on_floor():
		$AnimatedSprite.play("jump") #trigger jump animation while in air
	velocity.y=velocity.y+STATGRAVITY #this will act like gravity in game
	print(velocity.y)
	
	if Input.is_action_just_pressed("Jump") and is_on_floor(): #character will jump in game
		velocity.y=-STATJUMP
	velocity=move_and_slide(velocity,Vector2.UP) #without using this function character will not move
	velocity.x=lerp(velocity.x,0,0.5) #will stop the character when movement key is released 
		
func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")

