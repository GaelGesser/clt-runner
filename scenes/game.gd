extends Node2D
class_name Game

@export_category("Variáveis de controle")
@export var level_speed: float = 100;

@onready var parallax_background: Parallax2D = $Parallax

func _ready() -> void:
	parallax_background.autoscroll = Vector2(0, level_speed)
