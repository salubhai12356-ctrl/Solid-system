extends Node
class_name UIManager

var score_label: Label
var level_label: Label
var combo_label: Label

func _ready() -> void:
	score_label = $ScoreLabel
	level_label = $LevelLabel
	combo_label = $ComboLabel

func update_display(score: int, level: int, combo: int) -> void:
	score_label.text = "Score: %d" % score
	level_label.text = "Level: %d" % level
	combo_label.text = "Combo: %d" % combo if combo > 0 else ""
