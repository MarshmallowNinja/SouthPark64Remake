extends KinematicBody


# statisticles
var currentHealth : int = 100
var maxHealth : int = 100
var ammo : int = 50
var score : int = 0
var Name : String = "idk"

# enums
enum PlayerState {Live, Dead, Frozen, Transformed, Dancing, ForceStill}
enum PauseState {Unpause, Paused, HostPause, ClientPause}
enum ControlType {Keyboard, Controller}

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
var velocity : Vector3 = Vector3()
var mouseDelta : Vector2 = Vector2()
var Acceleration = Vector3()

#cum
onready var camera : Camera = get_node("Camera")
onready var muzzle : Spatial = get_node("Camera/Muzzle")
#onready var farter : AudioStreamPlayer = get_node("Farter")

#network
enum NetState {Offline, OnlineServer, OnlineLAN, OnlineP2P, Dummy}
enum NetRank {Host, Client, Server, Peer}
#var 
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
	if Input.is_action_just_pressed("num_test1"):
		RemoveHealth(currentHealth, 10)
	if Input.is_action_just_pressed("esc"):
		pass
	if Input.is_action_pressed("run"):
		moveSpeed = 12
		jumpForce = 12
	if Input.is_action_just_released("run"):
		moveSpeed = 7
		jumpForce = 10
	#if Input.is_action_just_pressed("taunt"):
	#	$Farter.playsong()
	
	var forward = global_transform.basis.z
	var right = global_transform.basis.x
	
	var relativeDir = (forward * input.y + right * input.x)
	
	velocity.x = relativeDir.x * moveSpeed
	velocity.z = relativeDir.z * moveSpeed
	
	velocity.y -= gravity * delta 
	
	velocity = move_and_slide(velocity, Vector3.UP, true)
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jumpForce

func _process(delta): #camera controls
	camera.rotation_degrees.x -= mouseDelta.y * lookSensitivity * delta
	
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minlookAngle, maxLookAngle)
	
	rotation_degrees.y -= mouseDelta.x * lookSensitivity * delta
	
	mouseDelta = Vector2()

func _input(event): #more camera controls
	if event is InputEventMouseMotion:
		mouseDelta = event.relative

func RemoveHealth(a, b):
	var result = a + b 
	
	if currentHealth <= 0:
		KillPlayer()
	else:
		return

func KillPlayer():
	print("You are dead, retard")


func _on_quit_pressed():
	get_tree().change_scene("res://Game/Widgets/Main Menu/MainMenu.tscn")
