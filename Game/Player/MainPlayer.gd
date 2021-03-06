extends KinematicBody

# statisticles
var Health : int = 100
var MaxHealth : int = 100
var Armor : int = 100
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
var onground : bool = true

# pppoooppp
var minlookAngle : float = -90.0
var maxLookAngle : float = 90.0
var lookSensitivity : float = 50
var walkAngle : float = 45.2

#vectorrrsrsrsrsorsooro
var velocity = Vector3.ZERO
var mouseDelta : Vector2 = Vector2()
var Acceleration = 10
var vel2 = Vector3()
var movement = Vector3()
var direction = Vector3()
var gravityv = Vector3()

#cum
onready var camera : Camera = get_node("Camera")
onready var muzzle : Spatial = get_node("Camera/Muzzle")
onready var floorcheck = $floorcheck
onready var pausemenu = $Camera/CanvasLayer/Control/pausemenu
onready var viewcheck = $Camera/viewcheck

#network
enum netstate {Offline, OnlineNotConn, OnlineServer, OnlineLAN, OnlineP2P, Dummy}
enum netrank {Host, Client, Server, Peer}
var NetState = netstate.Offline
var NetRank = netrank.Host

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta): #inputs
	direction = Vector3()
	
	if not is_on_floor():
		gravityv += Vector3.DOWN * gravity * delta
	elif is_on_floor() and floorcheck:
		gravityv = -get_floor_normal() * gravity
		gravityv = -get_floor_normal()
	
	onground = floorcheck.is_colliding()
	
	if Input.is_action_pressed("moveforward"):
		direction -= transform.basis.z
	if Input.is_action_pressed("moveback"):
		direction += transform.basis.z
	if Input.is_action_pressed("moveleft"):
		direction -= transform.basis.x
	if Input.is_action_pressed("moveright"):
		direction += transform.basis.x

	if Input.is_action_pressed("run"):
		moveSpeed = 12
		jumpForce = 12
	if Input.is_action_just_released("run"):
		moveSpeed = 7
		jumpForce = 10
	if Input.is_action_pressed("jump") and (is_on_floor() or floorcheck.is_colliding()):
		gravityv = Vector3.UP * jumpForce
		
	if Input.is_action_just_pressed("esc"):
		if pausemenu.visible == false:
			pausemenu.set_visible(true)
			get_tree().paused = true
			PauseState = pausestate.Paused
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			pausemenu.set_visible(false)
			get_tree().paused = false
			PauseState = pausestate.Unpaused
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	movement = movement.normalized() #Straferunning
	vel2 = vel2.linear_interpolate(direction * moveSpeed, Acceleration * delta)
	movement.z = vel2.z + gravityv.z
	movement.x = vel2.x + gravityv.x
	movement.y = gravityv.y
	move_and_slide(movement, Vector3.UP, true)

func _process(delta): #camera controls
	camera.rotation_degrees.x -= mouseDelta.y * lookSensitivity * delta
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minlookAngle, maxLookAngle)
	rotation_degrees.y -= mouseDelta.x * lookSensitivity * delta
	mouseDelta = Vector2()
	
	#if viewcheck.is_colliding():
		
	
	# other thingss
	$Camera/CanvasLayer/HealthBar.value = Health
	$Camera/CanvasLayer/ArmorBar.value = Armor

func _input(event): #more camera controls
	if event is InputEventMouseMotion:
		mouseDelta = event.relative

func Damage(a):
	Health -= a
	if Health <= 0:
		Kill()
	else:
		pass

func Heal(a):
	Health += a
	if Health > MaxHealth:
		Health = MaxHealth
	else:
		pass

func Kill():
	PlayerState = playerstate.Dead
	print("Dead.")

func _on_quit_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene("res://Game/Widgets/Main Menu/MainMenu.tscn")

func _on_resume_pressed():
	$Camera/CanvasLayer/Control/pausemenu.set_visible(false)
	get_tree().paused = false
	PauseState = pausestate.Unpaused
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#
#func PlayerStateCheck():
#	match PlayerState:
#		Live:
#
#		Dead:
#
