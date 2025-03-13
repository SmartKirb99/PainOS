extends Control
##Visualizer, yes I borrowed this from a tutorial
##
## @tutorial(Godot 4: Spectrum Analyzer shader tutorial): https://www.youtube.com/watch?v=2LHljiWIx3w

const VU_COUNT = 30
const FREQ_MAX = 11050.0
const MIN_DB = 60
const ANIMATION_SPEED = 0.1
const HEIGHT_SCALE = 1.0
##The color rectangle used by the audio visualizer
@onready var color_rect: ColorRect = $ColorRect
##The uh, spectrum thingy from the audio tab
var spectrum
##The minimum values from the data
var min_values = []
##The maximum values from the data
var max_values = []

##Prepares the visualizer to well, make it work
func _ready() -> void:
	spectrum = AudioServer.get_bus_effect_instance(0,0)
	min_values.resize(VU_COUNT)
	min_values.fill(0.0)
	max_values.resize(VU_COUNT)
	max_values.fill(0.0)


##Makes the visualizer work
func _process(delta: float) -> void:
	var prev_hz = 0
	var data = []
	for i in range(1, VU_COUNT + 1):
		var hz = i * FREQ_MAX / VU_COUNT
		var f = spectrum.get_magnitude_for_frequency_range(prev_hz, hz)
		var energy = clamp((MIN_DB + linear_to_db(f.length())) / MIN_DB, 0.0, 1.0)
		data.append(energy * HEIGHT_SCALE)
		prev_hz = hz
	for i in range(VU_COUNT):
		if data[i] > max_values[i]:
			max_values[i] = data[i]
		else:
			max_values[i] = lerp(max_values[i], data[i], ANIMATION_SPEED)
		if data[i] <= 0.0:
			min_values[i] = lerp(min_values[i], 0.0, ANIMATION_SPEED)
	var fft = []
	for i in range(VU_COUNT):
		fft.append(lerp(min_values[i], max_values[i], ANIMATION_SPEED))
	color_rect.get_material().set_shader_parameter("freq_data", data)
