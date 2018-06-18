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
	"1":"IT'S TOO %s IN HERE!",
	"2":"WHAT'S WRONG WITH THE AC?",
	"3":"WHY CAN'T SOMEONE FIX THIS?"
}

var dialogue_end = {
	"1":"I'M GIVING MY NOTICE",
	"2":"TIME TO FIND A NEW PLACE TO LIVE",
	"3":"I CAN'T TAKE IT ANYMORE"
}


#----------------------------------------------------------------------------------------------------
# _ready
#----------------------------------------------------------------------------------------------------

func _ready():
	set_rent()
	set_tolerance()
	print("min: ", tolerance_min)
	print("max: ", tolerance_max)
	print("duration: ", tolerance_duration)


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


func set_rent():
	rent = range(101, 201)[randi()%range(101, 201).size()]


#----------------------------------------------------------------------------------------------------
# set_dialogue
#----------------------------------------------------------------------------------------------------

func set_dialogue():

	var timer_s = Timer.new()
	timer_s.set_one_shot(true)
	timer_s.set_wait_time(4)
	timer_s.connect("timeout", self, "_on_timer_s_timeout")
	add_child(timer_s)
	timer_s.start()

	var timer_e = Timer.new()
	timer_e.set_one_shot(true)
	timer_e.set_wait_time(tolerance_duration)
	timer_e.connect("timeout", self, "_on_timer_e_timeout")
	add_child(timer_e)
	timer_e.start()

	$"dialogue/content".set_text(str(dialogue_start["1"]))
	$"dialogue".show()


#----------------------------------------------------------------------------------------------------
# _on_timeout
#----------------------------------------------------------------------------------------------------

#-------------------------
# timer_s
#-------------------------

func _on_timer_s_timeout():
	$"dialogue/content".set_text(str("FUCK"))
	$"dialogue".hide()


#-------------------------
# timer_e
#-------------------------

func _on_timer_e_timeout():

	satisfaction = false

	$"dialogue/content".set_text(str(satisfaction))
	$"dialogue".show()

	var timer_f = Timer.new()
	timer_f.set_one_shot(true)
	timer_f.set_wait_time(4)
	timer_f.connect("timeout", self, "_on_timer_f_timeout")
	add_child(timer_f)
	timer_f.start()


#-------------------------
# timer_f
#-------------------------

func _on_timer_f_timeout():

	$"dialogue/content".set_text(str(""))
	$"dialogue".hide()

	$"../".occupied = false


#----------------------------------------------------------------------------------------------------
# end
#----------------------------------------------------------------------------------------------------
