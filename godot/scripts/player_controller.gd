extends CharacterBody2D

# Player movement
var speed = 150.0
var acceleration = 500.0
var direction = Vector2.ZERO

# Player stats
var max_hp = 100.0
var hp = 100.0
var hunger = 100.0
var thirst = 100.0
var energy = 100.0
var temperature = 20.0

# Animation
@onready var animated_sprite = $AnimatedSprite2D
var facing_right = true

# Signals
signal stat_changed(stat_name, value)
signal died

func _ready():
	# Initialize player
	set_physics_process(true)
	update_animation()

func _physics_process(delta):
	# Handle input
	handle_input()
	
	# Update velocity
	if direction.length() > 0:
		velocity = velocity.move_toward(direction * speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, acceleration * delta)
	
	# Move player
	move_and_slide()
	
	# Update stats
	update_stats(delta)
	
	# Handle animation
	update_animation()

func handle_input():
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Normalize diagonal movement
	if direction.length() > 0:
		direction = direction.normalized()
		if direction.x > 0:
			facing_right = true
		elif direction.x < 0:
			facing_right = false

func update_stats(delta):
	# Decrease hunger and thirst over time
	hunger -= 0.05 * delta
	thirst -= 0.05 * delta
	
	# Clamp stats
	hunger = clamp(hunger, 0, 100)
	thirst = clamp(thirst, 0, 100)
	energy = clamp(energy, 0, 100)
	
	# Damage from hunger/thirst
	if hunger <= 0:
		take_damage(5 * delta)
	if thirst <= 0:
		take_damage(5 * delta)
	
	# Emit stat changes
	emit_signal("stat_changed", "hp", hp)
	emit_signal("stat_changed", "hunger", hunger)
	emit_signal("stat_changed", "thirst", thirst)
	emit_signal("stat_changed", "energy", energy)
	
	# Check if dead
	if hp <= 0:
		die()

func update_animation():
	if direction.length() > 0:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
	
	# Flip sprite based on facing direction
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

func die():
	emit_signal("died")
	queue_free()