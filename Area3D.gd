extends Area3D

# Обработчик события входа курсора в область объекта
func _on_Area_mouse_entered():
	# Увеличиваем масштаб объекта на 10%
	$Parent.scale *= 1.1
