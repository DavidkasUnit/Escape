extends Node3D


func _input(e):
	if e is InputEventKey:
		if e.pressed && e.keycode == KEY_ESCAPE:
			get_tree().change_scene_to_file("res://scenes/main_test_room.tscn")
