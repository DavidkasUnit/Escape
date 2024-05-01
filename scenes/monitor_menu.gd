extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_назад_pressed():
	get_tree().change_scene_to_file("res://scenes/main_test_room.tscn")
