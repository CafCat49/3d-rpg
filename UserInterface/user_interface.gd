extends Control

@onready var level_label: Label = %LevelLabel
@onready var health_bar: TextureProgressBar = %HealthBar
@onready var xp_bar: TextureProgressBar = %XPBar

@export var player: Player

func update_stats_display() -> void:
	level_label.text = str(player.stats.level)
	xp_bar.max_value = player.stats.level_up_boundary()
	xp_bar.value = player.stats.xp
