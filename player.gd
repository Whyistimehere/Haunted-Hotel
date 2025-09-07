extends CharacterBody3D
var health = 100

const SPEED = 4.0
const JUMP_VELOCITY = 5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var cam = $head/Camera3D
@onready var head = $head



func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	if Global.room_1_key_in_hand == true:
		$"head/Camera3D/room 1 key".show()
	if Global.room_1_key_in_hand == false:
		$"head/Camera3D/room 1 key".hide()
	
	
	
	
		#Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
 
	#controls
	var input_dir = Input.get_vector("move left", "move right", "move forwards", "move back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if Input.is_action_just_pressed("esc"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		await get_tree().create_timer(5).timeout
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	
	move_and_slide()

func _unhandled_input(event):
	
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x*0.002)

		cam.rotate_x(-event.relative.y*0.002)
		cam.rotation.x = clamp(cam.rotation.x,-1.5,1.4)


func _on_item_finder_body_entered(body):
	pass

	
		#Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
 
	#controls
	var input_dir = Input.get_vector("move left", "move right", "move forward", "move back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if Input.is_action_just_pressed("esc"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		await get_tree().create_timer(5).timeout
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	
	move_and_slide()


	
	
