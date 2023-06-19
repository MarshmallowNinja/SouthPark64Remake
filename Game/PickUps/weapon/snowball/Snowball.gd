extends RigidBody

const Damage = 2
const DamageSec = 5
const Speed = 5
var idle = false

func _ready():
	set_as_toplevel(true)

func _physics_process(delta: float):
	if idle:
		pass
	else:
		apply_impulse(transform.basis.z, -transform.basis.z * Speed)

func _on_Area_body_entered(body: Node):
	if body.is_in_group("living"):
		body.call("Damage", Damage)
		$AudioStreamPlayer3D.play()
		queue_free()
	else:
		$AudioStreamPlayer3D.play()
		queue_free()
