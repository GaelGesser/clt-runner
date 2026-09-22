extends Area2D
class_name Food

enum DIRECTION {LEFT, RIGHT}

@export var speed: float = 500;
@export var direction: DIRECTION = DIRECTION.LEFT

@onready var sprite: Sprite2D = $Sprite
@onready var animation: AnimationPlayer = $Animation
@onready var collision: CollisionShape2D = $Collision

func _ready() -> void:
	sprite.flip_h = direction == DIRECTION.RIGHT

func _physics_process(delta: float) -> void:
	position += Vector2.DOWN * speed * delta
