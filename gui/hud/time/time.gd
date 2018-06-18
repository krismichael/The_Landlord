extends Control

#----------------------------------------------------------------------------------------------------
# globals
#----------------------------------------------------------------------------------------------------

onready var w_clock = $"/root/gx/world/clock"

var ampm = null
var hours_display = 0


#----------------------------------------------------------------------------------------------------
# _process
#----------------------------------------------------------------------------------------------------

func _process(delta):

	if (w_clock.time_hours > 11):
		ampm = "PM"
	else:
		ampm = "AM"


	if (w_clock.time_hours > 12):
		hours_display = w_clock.time_hours - 12
	else:
		hours_display = w_clock.time_hours

	if (w_clock.time_hours < 1):
		hours_display = 12


	$"season".set_text(str(w_clock.season_curr))
	$"date".set_text(str("%02d : %02d %s" % [hours_display, w_clock.time_minutes, ampm]))


#----------------------------------------------------------------------------------------------------
# end
#----------------------------------------------------------------------------------------------------
