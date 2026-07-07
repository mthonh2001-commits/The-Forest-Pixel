extends CharacterBody2D

var speed = 150.0
var acceleration = 500.0
var direction = Vector2.ZERO
var max_hp = 100.0
var hp = 100.0
var hunger = 100.0
var thirst = 100.0
var energy = 100.0
var temperature = 20.0
var in_safe_zone = false
var hp_regen_active = false

@onready var animated_sprite = $AnimatedSprite2D
var facing_right = true

signal stat_changed(stat_name, value)
signal died

func _ready():
	set_physics_process(true)
	update_animation()

func _physics_process(delta):
	handle_input()
	if direction.length() > 0:
		velocity = velocity.move_toward(direction * speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, acceleration * delta)
	move_and_slide()
	update_stats(delta)
	update_animation()

func handle_input():
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction.length() > 0:
		direction = direction.normalized()
		if direction.x > 0:
			facing_right = true
		elif direction.x < 0:
			facing_right = false
	if Input.is_action_just_pressed("ui_accept"):
		interact_with_nearby_campfire()

func update_stats(delta):
	var hunger_decrease = 0.05 if not in_safe_zone else 0.025
	var thirst_decrease = 0.05 if not in_safe_zone else 0.025
	hunger -= hunger_decrease * delta
	thirst -= thirst_decrease * delta
	if in_safe_zone and hp < max_hp:
		var regen_amount = 10.0 * delta
		hp += regen_amount
		hp = clamp(hp, 0, max_hp)
	hunger = clamp(hunger, 0, 100)
	thirst = clamp(thirst, 0, 100)
	energy = clamp(energy, 0, 100)
	if hunger <= 0:
		take_damage(5 * delta)
	if thirst <= 0:
		take_damage(5 * delta)
	emit_signal("stat_changed", "hp", hp)
	emit_signal("stat_changed", "hunger", hunger)
	emit_signal("stat_changed", "thirst", thirst)
	emit_signal("stat_changed", "energy", energy)
	if hp <= 0:
		die()

func update_animation():
	if direction.length() > 0:
		animated_sprite.play("default")
	else:
		animated_sprite.play("default")
	if direction.x != 0:
		animated_sprite.flip_h = direction.x < 0

func take_damage(amount):
	hp -= amount
	hp = clamp(hp, 0, max_hp)

func heal(amount):
	hp += amount
	hp = clamp(hp, 0, max_hp)

func eat(hunger_amount):
	hunger += hunger_amount
	hunger = clamp(hunger, 0, 100)

func drink(thirst_amount):
	thirst += thirst_amount
	thirst = clamp(thirst, 0, 100)

func interact_with_nearby_campfire():
	var campfires = get_tree().get_nodes_in_group("campfire")
	if campfires.is_empty():
		return
	var nearest = campfires[0]
	var min_distance = global_position.distance_to(nearest.global_position)
	for campfire in campfires:
		var distance = global_position.distance_to(campfire.global_position)
		if distance < min_distance:
			nearest = campfire
			min_distance = distance
	if min_distance < 80:
		nearest.feed_resource("wood", 5)
		hunger -= 5

func die():
	emit_signal("died")
	queue_free()

func _input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_R:
				hp = max_hp
				hunger = 100
				thirst = 100
				energy = 100
