extends Control
class_name Introduction

# Lista dos quadrinhos que vão ser mostrados na tela
@export var comics: Array[Texture2D] = []

# Control para mostrar os quadrinhos na tela
@export var texture_rect: TextureRect

# Quadrinho atual
var current_comic_strip_index: int = 0;

func _ready() -> void:
	# Setando a imagem do primeiro quadrinho na tela
	texture_rect.texture = comics[current_comic_strip_index];
	

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("skip_comics"):
		next_comic_strip()

func next_comic_strip() -> void:
	# Se não estou no ultimo quadrinho ainda eu posso ir para o proximo
	if current_comic_strip_index < comics.size() - 1:
		current_comic_strip_index += 1
		texture_rect.texture = comics[current_comic_strip_index]
	else:
		# Se é o ultimo quadrado ai mudamos de cena
		get_tree().change_scene_to_file("res://scenes/game.tscn")
