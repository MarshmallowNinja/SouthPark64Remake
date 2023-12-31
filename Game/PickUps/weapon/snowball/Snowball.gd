extends RigidBody

var Damage = 2
var DamageSec = 5 # secondary damage
var Speed = 4.5

func _ready():
	set_as_toplevel(true) # don't mess with this, damn it.

func _physics_process(delta: float):
	apply_impulse(transform.basis.z, -transform.basis.z * Speed)

func _on_Area_body_entered(body: Node):
	if body.is_in_group("living"):
		body.call("Damage", Damage)
		lock()
		$CollisionShape.disabled = true
		$Area/CollisionShape2.disabled = true
		$sprite.visible = false
		$".".visible = false
		$".".sleeping = true
		$AudioStreamPlayer3D.play() # play impact sound
	else:
		lock()
		$CollisionShape.disabled = true
		$Area/CollisionShape2.disabled = true
		$sprite.visible = false
		$".".visible = false
		$".".sleeping = true
		$AudioStreamPlayer3D.play()

func _on_KillTimer_timeout() -> void:
	queue_free()

func _on_AudioStreamPlayer3D_finished():
	$".".queue_free()

func lock():
	$".".axis_lock_angular_x = true
	axis_lock_angular_y = true
	axis_lock_angular_z = true
	axis_lock_linear_x = true
	axis_lock_linear_y = true
	axis_lock_linear_z = true
