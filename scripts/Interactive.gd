extends RigidBody3D
class_name Interactive

var target = null


func _physics_process(delta):
	if target:
		global_transform = global_transform.interpolate_with(target.global_transform, delta * 10)
func take(_target):
	target = _target
	
	
func drop():
	pass
	
func push():
	pass

