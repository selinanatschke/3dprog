extends OmniLight

# Variables to control the flicker effect
export (float) var min_intensity = 0.5
export (float) var max_intensity = 1.5
export (float) var flicker_speed = 0.1

# Internal timer to control flickering
var flicker_timer = 0.0

func _ready():
	# Initialize the light's energy
	randomize()
	light_energy = randf_range(min_intensity, max_intensity)

func _process(delta):
	flicker_timer -= delta
	if flicker_timer <= 0:
		# Set a new random flicker interval
		flicker_timer = flicker_speed
		# Randomly change the light's energy
		light_energy = randf_range(min_intensity, max_intensity)

# Utility function to get a random float between a range
func randf_range(min_val: float, max_val: float) -> float:
	return lerp(min_val, max_val, randf())
