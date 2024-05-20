extends Node3D


func _input(e):
	if e is InputEventKey:
		if e.pressed && e.keycode == KEY_ESCAPE:
			get_tree().quit()
