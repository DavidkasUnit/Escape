extends StaticBody3D


func _on_mouse_entered():
	scale *= 1.1
	

func _on_mouse_exited():
	scale *= 0.909



func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT :
		load_new_scene()

func load_new_scene():
	get_tree().change_scene_to_file("res://scenes/loadScene.tscn")
