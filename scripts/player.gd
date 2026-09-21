extends Area2D
class_name Player

@export var marker_left: Marker2D
@export var marker_right: Marker2D

@onready var sprite: Sprite2D = $Sprite
@onready var collision: CollisionShape2D = $Collision
@onready var marker_collision_right: Marker2D = $MarkerCollisionRight
@onready var marker_collision_left: Marker2D = $MarkerCollisionLeft


func _ready() -> void:
	position = marker_left.position
	sprite.flip_h = false
	collision.position = marker_collision_left.position

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("right"):
		sprite.flip_h = true
		collision.position = marker_collision_right.position
		position = marker_right.global_position
	
	if event.is_action_pressed("left"):
		sprite.flip_h = false
		collision.position = marker_collision_left.position
		position = marker_left.global_position
