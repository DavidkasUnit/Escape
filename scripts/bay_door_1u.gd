#
extends StaticBody3D
#
#
#
#func _physics_process(delta):
	#if Global.active_door:
		#global_transform = global_transform.interpolate_with($Position2.global_transform, delta * 1)

# Начальная и конечная позиции
var start_position: Vector3
var target_position: Vector3 = Vector3(-19.909, 10, -5.165)  # Пример позиции, куда должен переместиться объект

# Скорость перемещения
var speed: float = 5.0


# Функция для установки начальной позиции объекта
func _ready():
	start_position = global_transform.origin

# Обновление состояния каждый кадр
func _process(delta):
	if Global.active_door:
		# Перемещаем объект к target_position
		move_to_position(target_position, delta)
	else:
		# Возвращаем объект на start_position
		move_to_position(start_position, delta)

# Функция для плавного перемещения к заданной позиции
func move_to_position(position: Vector3, delta: float):
	var current_position: Vector3 = global_transform.origin
	var direction: Vector3 = position - current_position
	if direction.length() > 0.1:  # Проверяем, что объект не на месте
		direction = direction.normalized() * speed * delta
		global_transform.origin += direction
