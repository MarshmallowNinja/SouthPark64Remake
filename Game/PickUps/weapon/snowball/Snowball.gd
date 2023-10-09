extends RigidBody

const Damage = 2
const DamageSec = 5 # secondary damage
const Speed = 5
var idle = false

func _ready():
	set_as_toplevel(true) # don't mess with this, damn it.

func _physics_process(delta: float):
	if idle: # if marked as idle, add no impulse.
		pass
	else:
		apply_impulse(transform.basis.z, -transform.basis.z * Speed)

func _on_Area_body_entered(body: Node):
	if body.is_in_group("living"):
		body.call("Damage", Damage)
		$AudioStreamPlayer3D.play() # play impact sound
		queue_free()
	else:
		$AudioStreamPlayer3D.play()
		queue_free()


func _on_KillTimer_timeout() -> void:
	queue_free()
