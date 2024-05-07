extends Control

# Called when the node enters the scene tree for the first time.


func _on_назад_pressed():
	get_tree().change_scene_to_file("res://scenes/main_test_room.tscn")


func _on_лвл_1_pressed():
	Global.lvl2 = false
	Global.lvl3 = false
	Global.lvl4 = false
	Global.lvl1 = true



func _on_лвл_2_pressed():
	Global.lvl1 = false
	Global.lvl3 = false
	Global.lvl4 = false
	Global.lvl2 = true
	

func _on_лвл_3_pressed():
	Global.lvl1 = false
	Global.lvl2 = false
	Global.lvl4 = false
	Global.lvl3 = true


func _on_лвл_4_pressed():
	Global.lvl1 = false
	Global.lvl2 = false
	Global.lvl3 = false
	Global.lvl4 = true

