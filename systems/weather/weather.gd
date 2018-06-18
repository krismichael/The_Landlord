extends Node

#----------------------------------------------------------------------------------------------------
# globals
#----------------------------------------------------------------------------------------------------

#-------------------------
# external
#-------------------------

onready var w_clock = $"/root/gx/world/clock"


#-------------------------
# constants
#-------------------------

const TEMPERATURE_BASE = 70
const TEMPERATURE_MIN = 20
const TEMPERATURE_MAX = 120


#-------------------------
# internal
#-------------------------

var temperature_curr = 0

var temperature_season = 0
var temperature_variable = 0

var day_next = 0


#----------------------------------------------------------------------------------------------------
# _ready
#----------------------------------------------------------------------------------------------------

func _ready():
	set_temperature_curr()
	day_next = w_clock.time_days + 1


#----------------------------------------------------------------------------------------------------
# _process
#----------------------------------------------------------------------------------------------------

func _process(delta):
	if (w_clock.time_days == day_next):
		set_temperature_curr()
		day_next = w_clock.time_days + 1


#----------------------------------------------------------------------------------------------------
# set_temperature_season
#----------------------------------------------------------------------------------------------------

func set_temperature_season():

	match w_clock.season_curr:
		"SPRING":
			temperature_season = range(1, 11)[randi()%range(1, 11).size()]
		"SUMMER":
			temperature_season = range(11, 31)[randi()%range(11, 31).size()]
		"FALL":
			temperature_season = -range(1, 11)[randi()%range(1, 11).size()]
		"WINTER":
			temperature_season = -range(11, 31)[randi()%range(11, 31).size()]

	return temperature_season


#----------------------------------------------------------------------------------------------------
# set_temperature_variable
#----------------------------------------------------------------------------------------------------

func set_temperature_variable():
	temperature_variable = range(-11, 11)[randi()%range(-11, 11).size()]


#----------------------------------------------------------------------------------------------------
# set_temperature_curr
#----------------------------------------------------------------------------------------------------

func set_temperature_curr():

	set_temperature_season()
	set_temperature_variable()

	temperature_curr = TEMPERATURE_BASE + temperature_season + temperature_variable

	if (temperature_curr < 20):
		temperature_curr = 20

	if (temperature_curr > 120):
		temperature_curr = 120

	return temperature_curr


#----------------------------------------------------------------------------------------------------
# end
#----------------------------------------------------------------------------------------------------
