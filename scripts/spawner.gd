extends Node2D
class_name Spawner

@export var marker_spawn_left: Marker2D
@export var marker_spawn_right: Marker2D

@export var items: Array[SpawnItem]
@export var enemy: PackedScene

@onready var timer_spawn: Timer = $TimerSpawn

func _ready() -> void:
	timer_spawn.start(5)


func _on_timer_spawn_timeout() -> void:
	#Descobrindo qual lado que vou spawnar
	var _direction_spawn: int = randi_range(0, 1)
	
	var _order_spawn: int = randi_range(0, 1)
	
	#Descobrindo qual comida spawnar
	var _food_chose: int = randi_range(0, items.size() - 1)
	
	var _food: Food = items[_food_chose].scene.instantiate()
	
	var _enemy: Enemy = enemy.instantiate()
	
	if _direction_spawn == 0:
		_food.position = marker_spawn_left.position
		_enemy.position = marker_spawn_left.position
	else:
		_food.position = marker_spawn_right.position
		_food.direction = _food.DIRECTION.RIGHT
		_enemy.position = marker_spawn_right.position
		_enemy.direction = _enemy.DIRECTION.RIGHT
	
	var _distance_beetwen_itens: Vector2 = Vector2(0, randi_range(-57, -80))
	
	if _order_spawn == 0:
		_food.position += _distance_beetwen_itens
	else:
		_enemy.position += _distance_beetwen_itens
	
	add_child(_food)
	add_child(_enemy)
	
	timer_spawn.start()
