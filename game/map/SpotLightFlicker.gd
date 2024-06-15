extends SpotLight

# Variables to control the flicker effect
export (float) var min_intensity = 0.5
export (float) var max_intensity = 1.5
export (float) var flicker_speed = 0.1
#export (float) 
var pause_duration = 5.0

# Internal timer and state to control flickering and pauses
var flicker_timer = 0.0
var pause_timer = 0.0
var is_flickering = true

func _ready():
	# Initialize the light's energy
	randomize()
	light_energy = randf_range(min_intensity, max_intensity)
	# Set initial timers
	flicker_timer = flicker_speed
	pause_timer = pause_duration

func _process(delta):
	if is_flickering:
		flicker_timer -= delta
		if flicker_timer <= 0:
			# Set a new random flicker interval
			flicker_timer = flicker_speed
			# Randomly change the light's energy
			light_energy = randf_range(min_intensity, max_intensity)
			# Chance to switch to pause state
			if randi() % 5 == 0:  # Randomly decide to pause (20% chance)
				is_flickering = false
				# Set light to max intensity or turn it off during pause
				light_energy = max_intensity if randf() > 0.5 else 0.0
	else:
		pause_timer -= delta
		if pause_timer <= 0:
			# End pause and switch back to flickering
			is_flickering = true
			pause_timer = pause_duration

# Utility function to get a random float between a range
func randf_range(min_val: float, max_val: float) -> float:
	return lerp(min_val, max_val, randf())
