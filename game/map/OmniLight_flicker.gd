extends OmniLight


# Variables to control the flickering effect
var min_intensity = 0.5
var max_intensity = 1.5
var flicker_speed = 0.1
var flicker_timer = 0

# Reference to the Light node
onready var lamp_light = $OmniLight  # Adjust this path according to your light node type and name

func _ready():
	# Initialization code
	flicker_timer = 0

func _process(delta):
	# Update the flicker timer
	flicker_timer += delta
	
	# Calculate the new intensity based on a sine wave to simulate flickering
	var flicker = sin(flicker_timer * flicker_speed) * (max_intensity - min_intensity) / 2 + (max_intensity + min_intensity) / 2
	
	# Apply the new intensity to the light
	lamp_light.light_energy = flicker
