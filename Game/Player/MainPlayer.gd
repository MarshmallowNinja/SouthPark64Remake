extends KinematicBody

signal Spawn
signal Heal
signal Hurt
signal Death

# stats
var Health : int 
var MaxHealth : int
var Armor : int = 0
var MaxArmor : int = 0
var Name : String = ""

# simple player states
enum playerstate {Live, Dead, Frozen, Transformed, Dancing, ForceStill}
var PlayerState = playerstate.Live
# Pause states for different modes
# unused for now, mainly used for multiplayer
enum pausestate {Unpaused, Paused, HostPause, ClientPause}
var PauseState = pausestate.Unpaused

# Physic things.
var moveSpeed : float = 10.0
var jumpForce : float = 10.0
var gravity : float = 30.0
var onground : bool = true
var viewgroup 

# Camera Variables
var minlookAngle : float = -90.0
var maxLookAngle : float = 90.0
var lookSensitivity : float = 10
var walkAngle : float = 45.2
var zoom : bool = false

# 3D Vectors. I'm too lazy to clean these up.
var mouseDelta : Vector2 = Vector2()
var Acceleration = 8
var velocity = Vector3()
var movement = Vector3()
var direction = Vector3()
var gravityv = Vector3()

# onready
onready var camera = $Camera
onready var floorcheck = $floorcheck
onready var pausemenu = $Camera/CanvasLayer/menus/pausemenu
onready var deadmenu = $Camera/CanvasLayer/menus/deadmenu
onready var viewcheck = $Camera/viewcheck
onready var character = $CharacterHandler
onready var teambar = $Camera/CanvasLayer/HUD/TeamBar
onready var weapon = $WeaponHandler

func _ready():
	get_tree().get_root().set_disable_input(true)
	Initiate()
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func Initiate():
	Health = $CharacterHandler.Character.StartingHealth
	MaxHealth = $CharacterHandler.Character.MaxHealth
	$Camera/CanvasLayer/HUD/CharacterName.text = $CharacterHandler.Character.CharacterName
	$Camera/CanvasLayer/HUD/TeamBar/TM1.texture = $CharacterHandler.Character.CharacterIcon
	emit_signal("Spawn")
	TakeControl()

func _physics_process(delta):
	direction = Vector3()
	# is player on floor? if not, make gravity do its job
	if not is_on_floor():
		gravityv += Vector3.DOWN * gravity * delta
	elif is_on_floor() and floorcheck:
		gravityv = -get_floor_normal() * gravity
		gravityv = -get_floor_normal()
	
	onground = floorcheck.is_colliding()
	# basic movement
	if Input.is_action_pressed("moveforward"):
		direction -= transform.basis.z
	if Input.is_action_pressed("moveback"):
		direction += transform.basis.z
	if Input.is_action_pressed("moveleft"):
		direction -= transform.basis.x
	if Input.is_action_pressed("moveright"):
		direction += transform.basis.x
	# jump
	if Input.is_action_pressed("jump") and (is_on_floor() or floorcheck.is_colliding()):
		# do a little fix on this
		gravityv = Vector3.UP * jumpForce
	
	# interaction
	if Input.is_action_just_pressed("interact"):
		Interact()
	
	if Input.is_action_just_pressed("suicide"):
		# mainly created this for a test
		Kill()
	
	if Input.is_action_just_pressed("taunt"):
		# replace with a thing that something who cares
		$farter.playsong()
	
	# pause menu functionality
	if Input.is_action_just_pressed("esc"):
		if pausemenu.visible == false:
			pausemenu.set_visible(true)
			$Camera/CanvasLayer/menus/menubg.set_visible(true)
			get_tree().paused = true
			PauseState = pausestate.Paused
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			pausemenu.set_visible(false)
			get_tree().paused = false
			PauseState = pausestate.Unpaused
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
	if Input.is_action_just_pressed("fire"):
		weapon.Fire()
	if Input.is_action_just_released("fire"):
		weapon.StopFire()
		
	if Input.is_action_pressed("secondfire"):
		weapon.SecondFire()
	if Input.is_action_just_released("secondfire"):
		weapon.StopSecondFire()
		
	# zoom function, will not be in final game
	if Input.is_action_just_pressed("tertiaryfire"):
				$Camera.fov = 25
				lookSensitivity = 5
	if Input.is_action_just_released("tertiaryfire"):
				$Camera.fov = 70
				lookSensitivity = 10
	
	# movement and acceleration
	#movement = movement.normalized()
	velocity = velocity.linear_interpolate(direction * moveSpeed, Acceleration * delta)
	movement.z = velocity.z + gravityv.z
	movement.x = velocity.x + gravityv.x
	movement.y = gravityv.y
# warning-ignore:return_value_discarded
	move_and_slide(movement, Vector3.UP, true)

func _process(delta): 
	#camera controls, mouse only
	camera.rotation_degrees.x -= mouseDelta.y * lookSensitivity * delta
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minlookAngle, maxLookAngle)
	rotation_degrees.y -= mouseDelta.x * lookSensitivity * delta
	mouseDelta = Vector2()
	# other things
	$Camera/CanvasLayer/HUD/HealthBar.value = Health
	$Camera/CanvasLayer/HUD/ArmorBar.value = Armor
	$Camera/CanvasLayer/HUD/FPS.set_bbcode("FPS: [wave]" + var2str(Engine.get_frames_per_second()) + "[/wave]")

func _input(event): #more camera controls
	if event is InputEventMouseMotion:
		mouseDelta = event.relative

func _on_resume_pressed():
	pausemenu.set_visible(false)
	$Camera/CanvasLayer/menus/menubg.set_visible(false)
	get_tree().paused = false
	PauseState = pausestate.Unpaused
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
func _on_quit_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game/Menu/Main Menu/MainMenu.tscn")

# Interact BS
func _on_viewcheck_area_entered(area: Area) -> void:
	if area.is_in_group("interact"):
		viewgroup = area
	else:
		pass
# warning-ignore:unused_argument
func _on_viewcheck_area_exited(area: Area) -> void:
	viewgroup = null

func PlayerStateCheck():
	match PlayerState:
		0: # Alive
			axis_lock_motion_x = false
			axis_lock_motion_z = false
			axis_lock_motion_y = false
		1: # Dead
			axis_lock_motion_x = true
			axis_lock_motion_z = true
		2: # Frozen
			axis_lock_motion_x = true
			axis_lock_motion_z = true

func Damage(a):
# overly complicated damage system
# may not even work
	if a <= Armor:
		var leftoverdmg : int
		leftoverdmg = a % Armor
		a -= Armor
		leftoverdmg -= Health
		emit_signal("Hurt")
	if Armor > 0:
		Armor -= a
		emit_signal("Hurt")
	else:
		Health -= a
		$AnimationPlayer.play("damage1")
		emit_signal("Hurt")
	if Health <= 0:
		Kill()

func Heal(a):
	Health += a
	$AnimationPlayer.play("heal")
	$PickupHandler.Pickup(1)
	emit_signal("Heal")
	if Health > MaxHealth:
		Health = MaxHealth
	else:
		pass

func AddArmor():
	Armor += 25
	if Armor > MaxArmor:
		Armor = MaxArmor
	else:
		pass

func Kill():
	PlayerState = playerstate.Dead
	PlayerStateCheck()
	emit_signal("Death")
	$AnimationPlayer.play("kill")
	$Camera/CanvasLayer/menus/menubg.set_visible(true)
	deadmenu.set_visible(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_cy_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
func _on_cn_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game/Menu/Main Menu/MainMenu.tscn")

# self explanatory
func Interact():
	if viewgroup == null:
		pass
	else:
		viewgroup.call("Interact")

# used for player spawn
# make sure to add input shit too
func TakeControl():
	$Camera.current = true
	get_tree().get_root().set_disable_input(false)
