extends KinematicBody2D

#----------------------------------------------------------------------------------------------------
#
#----------------------------------------------------------------------------------------------------

#-------------------------
#
#-------------------------

var tolerance_min = 0
var tolerance_max = 0
var tolerance_duration = 0

var satisfaction = true


#----------------------------------------------------------------------------------------------------
#
#----------------------------------------------------------------------------------------------------

func _ready():
	set_tolerance()
	print("min: ", tolerance_min)
	print("max: ", tolerance_max)
	print("duration: ", tolerance_duration)



func set_tolerance():

	var ran_num = range(20, 120)[randi()%range(20, 120).size()]

	tolerance_min = ran_num -10
	tolerance_max = ran_num +10

	tolerance_duration = range(11,31)[randi()%range(11,31).size()]

	return tolerance_min
	return tolerance_max
	return tolerance_duration


#----------------------------------------------------------------------------------------------------
# end
#----------------------------------------------------------------------------------------------------
