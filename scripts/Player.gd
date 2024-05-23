extends CharacterBody3D


const SPEED = 8.0
const JUMP_VELOCITY = 7.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var object = null 
var cast = null
const SENS = 0.003

@onready var head = $Head
@onready var camera = $Head/Camera3D
@onready var ray = $Head/Camera3D/Ray
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Global.player = self
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotation.y -=event.relative.x * SENS
		head.rotation.x = clamp(head.rotation.x - event.relative.y * SENS, -1.4 ,1.4)

	#if event is InputEventMouseMotion:
		#head.rotate_y(-event.relative.x * SENS)
		#camera.rotate_x(-event.relative.y * SENS)
		#
		#camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-80), deg_to_rad(90))

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Space") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("a", "d", "w", "s")
	var direction = (camera.global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
	
	cast = ray.get_collider()
	
func action_left():
	if cast is Interactive:
		if object:
			object.drop()
		print('Int')
		object = cast
		cast.take($target_object)
	else:
		if object:
			print('push')
			object.push()
			object = null

func action_right():
	if object:
		object.drop()
		object = null

func _input(e):
	if e is InputEventMouseButton:
		if e.pressed && e.button_index == MOUSE_BUTTON_LEFT:
			action_left()
			print(Global.active_door)
		if e.pressed && e.button_index == MOUSE_BUTTON_RIGHT:
			action_right()
	if e is InputEventKey:
		if e.pressed && e.keycode == KEY_F1:
			if Global.active_door:
				Global.active_door = false
			else:
				Global.active_door = true
	
