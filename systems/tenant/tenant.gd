extends KinematicBody2D

#----------------------------------------------------------------------------------------------------
# globals
#----------------------------------------------------------------------------------------------------

#-------------------------
#
#-------------------------

var rent = 0

var tolerance_min = 0
var tolerance_max = 0
var tolerance_duration = 0

var tolerance = 0

var satisfaction = true

var dialogue_start = {

	1:"WHAT'S WRONG WITH THE AC?",
	2:"WHY CAN'T SOMEONE FIX THIS?",
	3:"I HATE THIS WEATHER ..."
}

var dialogue_end = {
	1:"I'M GIVING MY NOTICE",
	2:"TIME TO FIND A NEW PLACE TO LIVE",
	3:"I CAN'T TAKE IT ANYMORE"
}


#----------------------------------------------------------------------------------------------------
# _ready
#----------------------------------------------------------------------------------------------------

func _ready():
	set_rent()
	set_tolerance()


#----------------------------------------------------------------------------------------------------
# set_tolerance
#----------------------------------------------------------------------------------------------------

func set_tolerance():

	tolerance = range(20, 120)[randi()%range(20, 120).size()]

	tolerance_min = tolerance -10
	tolerance_max = tolerance +10

	tolerance_duration = range(11,31)[randi()%range(11,31).size()]

	return tolerance
	return tolerance_min
	return tolerance_max
	return tolerance_duration


#----------------------------------------------------------------------------------------------------
# set_rent
#----------------------------------------------------------------------------------------------------

func set_rent():
	rent = range(101, 301)[randi()%range(101, 301).size()]


#----------------------------------------------------------------------------------------------------
# set_dialogue
#----------------------------------------------------------------------------------------------------

func set_dialogue():

	var timer_s = Timer.new()
	timer_s.set_one_shot(true)
	timer_s.set_wait_time(2)
	timer_s.connect("timeout", self, "_on_timer_s_timeout")
	timer_s.set_name("timer_s")
	add_child(timer_s)
	timer_s.start()

	satisfaction = false

	var timer_e = Timer.new()
	timer_e.set_one_shot(true)
	timer_e.set_wait_time(tolerance_duration)
	timer_e.connect("timeout", self, "_on_timer_e_timeout")
	timer_e.set_name("timer_e")
	add_child(timer_e)
	timer_e.start()

	$"dialogue/content".set_text(str(dialogue_start[range(1, 4)[randi()%range(1, 4).size()]]))
	$"dialogue".show()


#----------------------------------------------------------------------------------------------------
# _on_timeout
#----------------------------------------------------------------------------------------------------

#-------------------------
# timer_s
#-------------------------

func _on_timer_s_timeout():
	$"dialogue/content".set_text(str(""))
	$"dialogue".hide()

	$"timer_s".queue_free()


#-------------------------
# timer_e
#-------------------------

func _on_timer_e_timeout():

	if (!satisfaction):
		$"dialogue/content".set_text(str(dialogue_end[range(1, 4)[randi()%range(1, 4).size()]]))
		$"dialogue".show()

		var timer_f = Timer.new()
		timer_f.set_one_shot(true)
		timer_f.set_wait_time(2)
		timer_f.connect("timeout", self, "_on_timer_f_timeout")
		timer_f.set_name("timer_f")
		add_child(timer_f)
		timer_f.start()

	# Game breaking bug from time to time. Investigate later.
	print("timer_e")
	$"timer_e".queue_free()


#-------------------------
# timer_f
#-------------------------

func _on_timer_f_timeout():

	$"dialogue/content".set_text(str(""))
	$"dialogue".hide()

	if (!satisfaction):
		$"../".occupied = false
		$"/root/gx/".occupancy[$"../".apartment_number] = false
		$"../airconditioner/btn_action_repair".hide()

	$"timer_f".queue_free()


#----------------------------------------------------------------------------------------------------
# end
#----------------------------------------------------------------------------------------------------
