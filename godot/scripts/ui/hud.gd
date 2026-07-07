extends Control

@onready var time_label = $VBoxContainer/TimeLabel
@onready var day_label = $VBoxContainer/DayLabel
@onready var hp_bar = $VBoxContainer/HPBar
@onready var hunger_bar = $VBoxContainer/HungerBar
@onready var thirst_bar = $VBoxContainer/ThirstBar
@onready var energy_bar = $VBoxContainer/EnergyBar

var player: CharacterBody2D
var day_count = 1
var game_time = 0.0

func _ready():
	player = get_tree().root.get_child(0).find_child("Player", true, false)
	
	if player:
		player.stat_changed.connect(_on_player_stat_changed)
		hp_bar.max_value = player.max_hp
		hunger_bar.max_value = 100
		thirst_bar.max_value = 100
		energy_bar.max_value = 100
	else:
		print("ERROR: Player not found!")

func _on_player_stat_changed(stat_name: String, value: float):
	match stat_name:
		"hp":
			hp_bar.value = value
		"hunger":
			hunger_bar.value = value
		"thirst":
			thirst_bar.value = value
		"energy":
			energy_bar.value = value

func _process(delta):
	game_time += delta
	var total_game_seconds = 600.0
	var current_time = fmod(game_time, total_game_seconds) / total_game_seconds * 24
	day_count = int(game_time / total_game_seconds) + 1
	
	time_label.text = "Time: %02d:00" % int(current_time)
	day_label.text = "Day: %d" % day_count
