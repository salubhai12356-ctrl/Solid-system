extends Node2D
class_name Block

var grid_x: int = 0
var grid_y: int = 0
var color: Color = Color.WHITE
var game_manager: GameManager
var is_selected: bool = false
var touch_area: Area2D
var sprite: Sprite2D

func _ready() -> void:
	sprite = $Sprite2D
	touch_area = $Area2D
	touch_area.input_event.connect(_on_touch)

func initialize(x: int, y: int, block_color: Color, manager: GameManager) -> void:
	grid_x = x
	grid_y = y
	color = block_color
	game_manager = manager
	sprite.self_modulate = color

func _on_touch(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventScreenTouch and event.pressed:
		game_manager.select_block(self)

func select() -> void:
	is_selected = true
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.1)

func deselect() -> void:
	is_selected = false
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.1)
