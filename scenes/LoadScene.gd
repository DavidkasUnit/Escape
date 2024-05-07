extends Control

var next_scene = "res://scenes/test.tscn"
var time_passed = 0


var progress_bar
var loading_label

func _ready():
	progress_bar.value = 0
	loading_label.text = "Loading..."

func _process(delta):
	time_passed += delta
	var progress = min(time_passed / 1.4, 1.0) 
	progress_bar.value = progress * 100

	if time_passed >= 1.4:
		if Global.lvl1 == true :
			get_tree().change_scene_to_file("res://scenes/GamePostOffice.tscn")
		if Global.lvl2 == true :
			get_tree().change_scene_to_file("res://scenes/test2.tscn")
		if Global.lvl3 == true :
			get_tree().change_scene_to_file("res://scenes/test3.tscn")
		if Global.lvl4 == true :
			get_tree().change_scene_to_file("res://scenes/test4.tscn")	


func _on_progress_label_ready():
	loading_label = $ProgressLabel 


func _on_progress_bar_line_ready():
	progress_bar = $ProgressBarLine 
