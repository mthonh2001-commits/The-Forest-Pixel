extends Node

class_name CampfireSystem

# Campfire data
class Campfire:
	var position: Vector2
	var level: int = 1
	var experience: float = 0.0
	var safe_radius: int
	var crafting_speed_multiplier: float
	var hp_regen_bonus: float
	var resource_cost: Dictionary
	
	func _init(pos: Vector2):
		position = pos
		safe_radius = 20
		crafting_speed_multiplier = 1.0
		hp_regen_bonus = 0.5
		resource_cost = {
			"wood": 10,
			"stone": 5,
			"ore": 0,
			"coal": 0,
			"gold": 0
		}

# Campfire level data
const CAMPFIRE_LEVELS = {
	1: {
		"safe_radius": 20,
		"crafting_speed": 1.0,
		"hp_regen": 0.5,
		"resources": {"wood": 10, "stone": 5, "ore": 0, "coal": 0, "gold": 0},
		"exp_required": 100
	},
	2: {
		"safe_radius": 35,
		"crafting_speed": 1.1,
		"hp_regen": 0.75,
		"resources": {"wood": 20, "stone": 10, "ore": 5, "coal": 0, "gold": 0},
		"exp_required": 250
	},
	3: {
		"safe_radius": 50,
		"crafting_speed": 1.2,
		"hp_regen": 1.0,
		"resources": {"wood": 40, "stone": 20, "ore": 15, "coal": 0, "gold": 0},
		"exp_required": 500
	},
	4: {
		"safe_radius": 70,
		"crafting_speed": 1.3,
		"hp_regen": 1.5,
		"resources": {"wood": 80, "stone": 40, "ore": 30, "coal": 15, "gold": 0},
		"exp_required": 1000
	},
	5: {
		"safe_radius": 100,
		"crafting_speed": 1.5,
		"hp_regen": 2.0,
		"resources": {"wood": 150, "stone": 80, "ore": 60, "coal": 40, "gold": 30},
		"exp_required": 2000
	}
}

# Resource XP values
const RESOURCE_EXP_VALUES = {
	"wood": 5,
	"stone": 10,
	"ore": 20,
	"coal": 30,
	"gold": 50
}

var campfires = []
var active_campfire = 0  # Index of active safe zone campfire

# Signals
signal campfire_level_changed(campfire_index, new_level)
signal campfire_experience_changed(campfire_index, experience, max_experience)
signal player_entered_safe_zone(campfire_index)
signal player_left_safe_zone(campfire_index)

func _ready():
	# Initialize campfire system
	pass

func create_campfire(position: Vector2) -> Campfire:
	var campfire = Campfire.new(position)
	campfires.append(campfire)
	return campfire

func feed_resource_to_campfire(campfire_index: int, resource_type: String, amount: int) -> bool:
	if campfire_index >= campfires.size():
		return false
	
	var campfire = campfires[campfire_index]
	var exp_gained = amount * RESOURCE_EXP_VALUES.get(resource_type, 0)
	
	campfire.experience += exp_gained
	
	# Check for level up
	if campfire.level < 5:
		var exp_required = CAMPFIRE_LEVELS[campfire.level + 1].get("exp_required", 0)
		if campfire.experience >= exp_required:
			level_up_campfire(campfire_index)
	
	emit_signal("campfire_experience_changed", campfire_index, campfire.experience, CAMPFIRE_LEVELS[campfire.level].get("exp_required", 0))
	return true

func level_up_campfire(campfire_index: int) -> bool:
	if campfire_index >= campfires.size():
		return false
	
	var campfire = campfires[campfire_index]
	if campfire.level >= 5:
		return false
	
	campfire.level += 1
	campfire.experience = 0
	
	# Update stats based on level
	var level_data = CAMPFIRE_LEVELS[campfire.level]
	campfire.safe_radius = level_data["safe_radius"]
	campfire.crafting_speed_multiplier = level_data["crafting_speed"]
	campfire.hp_regen_bonus = level_data["hp_regen"]
	campfire.resource_cost = level_data["resources"]
	
	emit_signal("campfire_level_changed", campfire_index, campfire.level)
	return true

func is_in_safe_zone(player_position: Vector2, campfire_index: int = active_campfire) -> bool:
	if campfire_index >= campfires.size():
		return false
	
	var campfire = campfires[campfire_index]
	var distance = player_position.distance_to(campfire.position)
	return distance <= campfire.safe_radius