extends Node2D
class_name GameManager

const GRID_WIDTH = 4
const GRID_HEIGHT = 6
const BLOCK_SIZE = 120
const BLOCK_SPACING = 10
const COLORS = [
	Color.RED,
	Color.BLUE,
	Color.GREEN,
	Color.YELLOW,
	Color.MAGENTA
]

var grid: Array = []
var selected_blocks: Array = []
var score: int = 0
var level: int = 1
var combo: int = 0
var ui_manager: UIManager
var block_scene: PackedScene

func _ready() -> void:
	block_scene = preload("res://scenes/Block.tscn")
	ui_manager = $UIManager
	initialize_grid()
	update_ui()

func initialize_grid() -> void:
	grid.clear()
	selected_blocks.clear()
	
	for y in range(GRID_HEIGHT):
		var row: Array = []
		for x in range(GRID_WIDTH):
			var block = block_scene.instantiate()
			var color_idx = randi() % COLORS.size()
			block.initialize(x, y, COLORS[color_idx], self)
			var pos_x = 70 + x * (BLOCK_SIZE + BLOCK_SPACING)
			var pos_y = 150 + y * (BLOCK_SIZE + BLOCK_SPACING)
			block.position = Vector2(pos_x, pos_y)
			add_child(block)
			row.append(block)
		grid.append(row)

func select_block(block: Node2D) -> void:
	var block_obj = block as Block
	
	# If clicking on already selected block, deselect
	if block in selected_blocks:
		if selected_blocks.size() > 0 and selected_blocks[-1] == block:
			deselect_last()
			return
	
	# Only add if adjacent to last selected and same color
	if selected_blocks.is_empty():
		selected_blocks.append(block)
		block_obj.select()
	else:
		var last_block = selected_blocks[-1] as Block
		if is_adjacent(last_block, block_obj) and last_block.color == block_obj.color:
			selected_blocks.append(block)
			block_obj.select()
		elif selected_blocks.size() >= 3:
			# Finish match if we have 3+ blocks
			finish_match()

func is_adjacent(block1: Block, block2: Block) -> bool:
	var diff_x = abs(block1.grid_x - block2.grid_x)
	var diff_y = abs(block1.grid_y - block2.grid_y)
	return (diff_x == 1 and diff_y == 0) or (diff_x == 0 and diff_y == 1)

func deselect_last() -> void:
	if selected_blocks.size() > 0:
		var block = selected_blocks.pop_back() as Block
		block.deselect()

func deselect_all() -> void:
	for block in selected_blocks:
		var b = block as Block
		b.deselect()
	selected_blocks.clear()

func finish_match() -> void:
	if selected_blocks.size() < 3:
		return
	
	# Calculate score
	var match_size = selected_blocks.size()
	var points = (match_size * 10) * level + (combo * 5)
	score += points
	combo += 1
	
	# Remove matched blocks
	for block in selected_blocks:
		var b = block as Block
		b.queue_free()
		grid[b.grid_y][b.grid_x] = null
	
	selected_blocks.clear()
	refill_grid()
	update_ui()

func refill_grid() -> void:
	# Drop blocks down
	for x in range(GRID_WIDTH):
		var write_pos = GRID_HEIGHT - 1
		for y in range(GRID_HEIGHT - 1, -1, -1):
			if grid[y][x] != null:
				if write_pos != y:
					var block = grid[y][x] as Block
					block.grid_y = write_pos
					var new_pos = block.position
					new_pos.y = 150 + write_pos * (BLOCK_SIZE + BLOCK_SPACING)
					var tween = create_tween()
					tween.tween_property(block, "position", new_pos, 0.3)
					grid[write_pos][x] = block
					grid[y][x] = null
				write_pos -= 1
	
	# Add new blocks from top
	for x in range(GRID_WIDTH):
		for y in range(GRID_HEIGHT):
			if grid[y][x] == null:
				var block = block_scene.instantiate()
				var color_idx = randi() % COLORS.size()
				block.initialize(x, y, COLORS[color_idx], self)
				var pos_x = 70 + x * (BLOCK_SIZE + BLOCK_SPACING)
				var pos_y = 150 + y * (BLOCK_SIZE + BLOCK_SPACING) - 200
				block.position = Vector2(pos_x, pos_y)
				add_child(block)
				
				var tween = create_tween()
				tween.tween_property(block, "position", Vector2(pos_x, 150 + y * (BLOCK_SIZE + BLOCK_SPACING)), 0.4)
				grid[y][x] = block

func update_ui() -> void:
	if score > level * 500:
		level += 1
	ui_manager.update_display(score, level, combo)

func reset_combo() -> void:
	combo = 0
