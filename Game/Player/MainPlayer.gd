extends KinematicBody

# statisticles
var Health : int = 100
var MaxHealth : int = 100
var Score : int = 0
var Name : String = "idk"
export(Resource) var CharacterFile

# enums
# simple player states
enum playerstate {Live, Dead, Frozen, Transformed, Dancing, ForceStill}
var PlayerState = playerstate.Live
# Pause states for different modes
enum pausestate {Unpaused, Paused, HostPause, ClientPause}
var PauseState = pausestate.Unpaused
# to be used for future use or something like that
enum controltype {Keyboard, Controller}
var ControlType = controltype.Keyboard

# physics and shit
var moveSpeed : float = 7.0
var jumpForce : float = 10.0
var gravity : float = 30.0
var moveAccel = 4

# pppoooppp
var minlookAngle : float = -90.0
var maxLookAngle : float = 90.0
var lookSensitivity : float = 50
var walkAngle : float = 45.2

#vectorrrsrsrsrsorsooro
var velocity = Vector3.ZERO
var mouseDelta : Vector2 = Vector2()
var Acceleration = Vector3()

#cum
onready var camera : Camera = get_node("Camera")
onready var muzzle : Spatial = get_node("Camera/Muzzle")

#network
enum netstate {Offline, OnlineNotConn, OnlineServer, OnlineLAN, OnlineP2P, Dummy}
enum netrank {Host, Client, Server, Peer}
var NetState = netstate.Offline
var NetRank = netrank.Host

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta): #inputs
	velocity.z = 0
	var input = Vector2()
	
	if Input.is_action_pressed("moveforward"):
		input.y -= 1
	if Input.is_action_pressed("moveback"):
		input.y += 1
	if Input.is_action_pressed("moveleft"):
		input.x -= 1
	if Input.is_action_pressed("moveright"):
		input.x += 1
	
	if Input.is_action_just_pressed("esc"):
		if $Camera/CanvasLayer/Control/pausemenu.visible == false:
			$Camera/CanvasLayer/Control/pausemenu.set_visible(true)
			get_tree().paused = true
			PauseState = pausestate.Paused
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			$Camera/CanvasLayer/Control/pausemenu.set_visible(false)
			get_tree().paused = false
			PauseState = pausestate.Unpaused
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if Input.is_action_pressed("run"):
		moveSpeed = 12
		jumpForce = 12
	if Input.is_action_just_released("run"):
		moveSpeed = 7
		jumpForce = 10
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jumpForce
	
	var forward = global_transform.basis.z
	var right = global_transform.basis.x
	var relativeDir = (forward * input.y + right * input.x)
	
	velocity.x = relativeDir.x * moveSpeed
	velocity.z = relativeDir.z * moveSpeed
	
	velocity.y -= gravity * delta 
	
	velocity = move_and_slide(velocity, Vector3.UP, true)

func _process(delta): #camera controls
	camera.rotation_degrees.x -= mouseDelta.y * lookSensitivity * delta
	
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minlookAngle, maxLookAngle)
	
	rotation_degrees.y -= mouseDelta.x * lookSensitivity * delta
	
	mouseDelta = Vector2()
	
	$Camera/CanvasLayer/ProgressBar.value = Health

func _input(event): #more camera controls
	if event is InputEventMouseMotion:
		mouseDelta = event.relative

func RemoveHealth(a, b):
	var result = a + b 
	
	if Health <= 0:
		KillPlayer()
	else:
		return

func KillPlayer():
	print("You are dead, retard")

func _on_quit_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene("res://Game/Widgets/Main Menu/MainMenu.tscn")

func _on_resume_pressed():
	$Camera/CanvasLayer/Control/pausemenu.set_visible(false)
	get_tree().paused = false
	PauseState = pausestate.Unpaused
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
