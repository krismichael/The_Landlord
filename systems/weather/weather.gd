extends Node

#----------------------------------------------------------------------------------------------------
# globals
#----------------------------------------------------------------------------------------------------

#-------------------------
# external
#-------------------------

onready var w_season = $"/root/gx/world/clock".season
onready var w_day = $"/root/gx/world/clock".day


#-------------------------
# internal
#-------------------------

var temperature_base = 70
var temperature_min = 20
var temperature_max = 120

var temperature_season = 0
var temperature_variable = 0
var temperature_curr = 0

var day_prev = null
var day_curr = null


#----------------------------------------------------------------------------------------------------
# _process
#----------------------------------------------------------------------------------------------------

func _ready():
	set_temperature_curr()
	print("Temperature: ", temperature_curr)


#----------------------------------------------------------------------------------------------------
#
#----------------------------------------------------------------------------------------------------

#func _process(delta):
#	set_temperature_curr()


#----------------------------------------------------------------------------------------------------
# set_temperature_season
#----------------------------------------------------------------------------------------------------

func set_temperature_season():

	match w_season:
		"SPRING":
			temperature_season = 5
		"SUMMER":
			temperature_season = 10
		"FALL":
			temperature_season = -5
		"WINTER":
			temperature_season = -10

	return temperature_season


#----------------------------------------------------------------------------------------------------
# set_temperature_variable
#----------------------------------------------------------------------------------------------------

func set_temperature_variable():
	temperature_variable = range(1, 21)[randi()%range(1, 21).size()]


#----------------------------------------------------------------------------------------------------
# set_temperature_curr
#----------------------------------------------------------------------------------------------------

func set_temperature_curr():

	set_temperature_season()
	set_temperature_variable()

	temperature_curr = temperature_base + temperature_season + temperature_variable

	return temperature_curr


#----------------------------------------------------------------------------------------------------
# end
#----------------------------------------------------------------------------------------------------
