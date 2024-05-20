extends RigidBody3D
class_name Interactive

var target = null


func _physics_process(delta):
	if target:
		global_transform = global_transform.interpolate_with(target.global_transform, delta * 10)

func take(_target):
	target = _target
	freeze = true

func drop():
	target = null
	freeze = false
	apply_central_impulse(transform.basis.z * -1)

func push():
	target = null
	freeze = false
	apply_central_impulse(transform.basis.z * -10)


