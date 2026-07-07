extends Node

class_name InventoryManager

# Inventory constants
const HOTBAR_SIZE = 8
const BACKPACK_ROWS = 3
const BACKPACK_COLS = 8
const MAX_STACK_SIZE = 64
const MAX_WEIGHT = 50.0

# Item data
class Item:
	var name: String
	var type: String  # resource, tool, food, armor, misc
	var quantity: int = 1
	var weight: float = 0.1
	var max_stack: int = 64
	var rarity: String = "common"  # common, uncommon, rare, epic, legendary
	
	func _init(p_name: String, p_type: String, p_quantity: int = 1, p_weight: float = 0.1):
		name = p_name
		type = p_type
		quantity = p_quantity
		weight = p_weight

# Inventory storage
var hotbar = []
var backpack = []
var current_weight = 0.0

# Signals
signal inventory_changed
signal item_added(item_name, quantity)
signal item_removed(item_name, quantity)
signal inventory_full

func _ready():
	# Initialize inventory
	for i in range(HOTBAR_SIZE):
		hotbar.append(null)
	
	for i in range(BACKPACK_ROWS * BACKPACK_COLS):
		backpack.append(null)

func add_item(item_name: String, quantity: int = 1, item_type: String = "resource", weight: float = 0.1) -> bool:
	# Check weight
	var total_weight = quantity * weight
	if current_weight + total_weight > MAX_WEIGHT:
		emit_signal("inventory_full")
		return false
	
	# Try to stack with existing items
	var remaining = quantity
	
	# Check hotbar first
	for i in range(HOTBAR_SIZE):
		if remaining <= 0:
			break
		if hotbar[i] != null and hotbar[i].name == item_name and hotbar[i].quantity < MAX_STACK_SIZE:
			var space = MAX_STACK_SIZE - hotbar[i].quantity
			var added = min(space, remaining)
			hotbar[i].quantity += added
			remaining -= added
	
	# Check backpack
	for i in range(backpack.size()):
		if remaining <= 0:
			break
		if backpack[i] != null and backpack[i].name == item_name and backpack[i].quantity < MAX_STACK_SIZE:
			var space = MAX_STACK_SIZE - backpack[i].quantity
			var added = min(space, remaining)
			backpack[i].quantity += added
			remaining -= added
	
	# Add new item stacks if needed
	if remaining > 0:
		# Try hotbar first
		for i in range(HOTBAR_SIZE):
			if remaining <= 0:
				break
			if hotbar[i] == null:
				var new_item = Item.new(item_name, item_type)
				new_item.weight = weight
				var added = min(MAX_STACK_SIZE, remaining)
				new_item.quantity = added
				hotbar[i] = new_item
				remaining -= added
		
		# Then backpack
		for i in range(backpack.size()):
			if remaining <= 0:
				break
			if backpack[i] == null:
				var new_item = Item.new(item_name, item_type)
				new_item.weight = weight
				var added = min(MAX_STACK_SIZE, remaining)
				new_item.quantity = added
				backpack[i] = new_item
				remaining -= added
		
		# If still remaining, inventory is full
		if remaining > 0:
			emit_signal("inventory_full")
			# Add what we could
			quantity -= remaining
	
	current_weight += (quantity * weight)
	emit_signal("item_added", item_name, quantity)
	emit_signal("inventory_changed")
	return remaining == 0

func get_item_count(item_name: String) -> int:
	var count = 0
	
	for item in hotbar:
		if item != null and item.name == item_name:
			count += item.quantity
	
	for item in backpack:
		if item != null and item.name == item_name:
			count += item.quantity
	
	return count

func get_remaining_weight() -> float:
	return MAX_WEIGHT - current_weight

func is_inventory_full() -> bool:
	return current_weight >= MAX_WEIGHT