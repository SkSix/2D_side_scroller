extends KinematicBody

export var speed=10
var accelerate=5
var gravity=1
var jump_power=30
var velocity=Vector3()
var mouse_sen=0.3
var camera_x_rotation=0

onready var head=$Head
onready var camera=$Head/Camera

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"): 
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) #show mouse pointer

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) #set mouse curser to the middle of the screen and mouse pointer will be invisible

func _input(event): #for mouse movement
	if event is InputEventMouseMotion:
		var movement=event.relative
		camera.rotation.x += -deg2rad(movement.y * mouse_sen)
		camera.rotation.x = clamp(camera.rotation.x,deg2rad(-90),deg2rad(90))
		head.rotation.y += -deg2rad(movement.x * mouse_sen)

func _physics_process(delta): #for player movement
	var head_basis=head.get_global_transform().basis
	var direction=Vector3()
	if Input.is_action_pressed("forward"):
		direction -= head_basis.z
	elif Input.is_action_pressed("backward"):
		direction += head_basis.z
	
	if Input.is_action_pressed("left"):
		direction -= head_basis.x
	elif Input.is_action_pressed("right"):
		direction += head_basis.x
	
	direction=direction.normalized() #player can move normally in a direction which is combination of x and y
	velocity=velocity.linear_interpolate(direction * speed, accelerate * delta) #will fix immediate stop or start of player movement when arrow key is pressed
	velocity.y -= gravity
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y= jump_power
	velocity=move_and_slide(velocity, Vector3.UP) #will allow player to move
