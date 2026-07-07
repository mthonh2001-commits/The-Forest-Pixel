extends Node2D

class_name CampfireNode

@onready var exp_bar = $ProgressBar
@onready var level_label = $Label
@onready var area = $Area2D
@onready var sprite = $Sprite2D

var campfire_system: CampfireSystem
var campfire: CampfireSystem.Campfire
var level = 1
var experience = 0.0
var is_player_inside = false

func _ready():
	campfire_system = CampfireSystem.new()
	campfire = campfire_system.create_campfire(global_position)
	add_to_group("campfire")
	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)
	
	if sprite:
		var image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
		for y in range(32):
			for x in range(32):
				var dist = sqrt((x - 16) * (x - 16) + (y - 16) * (y - 16))
				if dist < 16:
					image.set_pixel(x, y, Color.RED)
				else:
					image.set_pixel(x, y, Color.TRANSPARENT)
		sprite.texture = ImageTexture.create_from_image(image)
	update_ui()

func _on_body_entered(body):
	if body.name == "Player":
		is_player_inside = true
		body.in_safe_zone = true

func _on_body_exited(body):
	if body.name == "Player":
		is_player_inside = false
		body.in_safe_zone = false

func feed_resource(resource_type: String, amount: int):
	if campfire_system.feed_resource_to_campfire(0, resource_type, amount):
		level = campfire.level
		experience = campfire.experience
		update_ui()

func update_ui():
	level_label.text = "Campfire Lv%d" % level
	var level_data = CampfireSystem.CAMPFIRE_LEVELS.get(level, {})
	var exp_required = level_data.get("exp_required", 100)
	if level < 5:
		var next_level_data = CampfireSystem.CAMPFIRE_LEVELS.get(level + 1, {})
		exp_required = next_level_data.get("exp_required", 100)
	exp_bar.max_value = exp_required
	exp_bar.value = experience
	var radius = campfire_system.get_safe_zone_radius(0)
	if area and area.get_child(0):
		var collision_shape = area.get_child(0)
		if collision_shape is CollisionShape2D:
			var circle_shape = CircleShape2D.new()
			circle_shape.radius = float(radius)
			collision_shape.shape = circle_shape
