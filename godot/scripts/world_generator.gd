extends Node2D

class_name WorldGenerator

# World generation settings
const CHUNK_SIZE = 64
const WORLD_SEED = 12345
const NOISE_SCALE = 0.1

# Tile types
enum TileType {
	GRASS,
	FOREST,
	WATER,
	MOUNTAIN,
	DESERT,
	SWAMP
}

# Perlin noise for terrain generation
var noise: FastNoiseLite
var chunks = {}

func _ready():
	# Initialize noise generator
	noise = FastNoiseLite.new()
	noise.seed = WORLD_SEED
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	noise.frequency = NOISE_SCALE
	
	# Generate initial chunks around player
	generate_around_position(Vector2.ZERO)

func generate_around_position(position: Vector2):
	var chunk_x = int(position.x / CHUNK_SIZE)
	var chunk_y = int(position.y / CHUNK_SIZE)
	
	# Generate 3x3 chunk grid around player
	for cx in range(chunk_x - 1, chunk_x + 2):
		for cy in range(chunk_y - 1, chunk_y + 2):
			generate_chunk(cx, cy)

func generate_chunk(chunk_x: int, chunk_y: int) -> Array:
	var key = Vector2i(chunk_x, chunk_y)
	
	# Check if chunk already exists
	if chunks.has(key):
		return chunks[key]
	
	var chunk_data = []
	
	# Generate tiles for chunk
	for y in range(CHUNK_SIZE):
		var row = []
		for x in range(CHUNK_SIZE):
			var world_x = chunk_x * CHUNK_SIZE + x
			var world_y = chunk_y * CHUNK_SIZE + y
			
			var tile = generate_tile(world_x, world_y)
			row.append(tile)
		chunk_data.append(row)
	
	chunks[key] = chunk_data
	return chunk_data

func generate_tile(world_x: int, world_y: int) -> int:
	# Get noise value at this position
	var noise_value = noise.get_noise_2d(world_x, world_y)
	
	# Convert noise to tile type based on thresholds
	if noise_value < -0.5:
		return TileType.WATER
	elif noise_value < -0.2:
		return TileType.SWAMP
	elif noise_value < 0.2:
		return TileType.GRASS
	elif noise_value < 0.5:
		return TileType.FOREST
	else:
		return TileType.MOUNTAIN

func get_tile(world_x: int, world_y: int) -> int:
	var chunk_x = int(world_x / CHUNK_SIZE)
	var chunk_y = int(world_y / CHUNK_SIZE)
	
	# Generate chunk if it doesn't exist
	if not chunks.has(Vector2i(chunk_x, chunk_y)):
		generate_chunk(chunk_x, chunk_y)
	
	var local_x = world_x % CHUNK_SIZE
	var local_y = world_y % CHUNK_SIZE
	
	if local_x < 0:
		local_x += CHUNK_SIZE
	if local_y < 0:
		local_y += CHUNK_SIZE
	
	var chunk = chunks[Vector2i(chunk_x, chunk_y)]
	return chunk[local_y][local_x]