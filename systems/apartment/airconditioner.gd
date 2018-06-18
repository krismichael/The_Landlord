extends Node2D

#----------------------------------------------------------------------------------------------------
#
#----------------------------------------------------------------------------------------------------

onready var w_clock = $"/root/gx/world/clock"
onready var p_financial = $"/root/gx/player/data/financial"

onready var t_tolerance = $"../tenant"


var is_running = true
var is_damaged = false
var health = 100

var day_next = 0


#----------------------------------------------------------------------------------------------------
#
#----------------------------------------------------------------------------------------------------

func _process(delta):

	if (is_damaged):
		damaged()


	if (w_clock.time_days == day_next):
		if (is_running):
			running()
			day_next = w_clock.time_days + 1

	$"label".set_text(str(health))

	$"thermometer".set_value(t_tolerance.tolerance)


#----------------------------------------------------------------------------------------------------
# functions
#----------------------------------------------------------------------------------------------------

#-------------------------
# running
#-------------------------

func running():
	var tenant = $"../tenant"
	var w_temperature_curr = $"/root/gx/world/weather".temperature_curr

	var difference = 0

	if (tenant.tolerance > w_temperature_curr):
		difference = tenant.tolerance - w_temperature_curr

	if (tenant.tolerance < w_temperature_curr):
		difference = w_temperature_curr - tenant.tolerance

	health = health - difference

	if (health < 1):
		is_damaged = true

	return health

#-------------------------
# damaged
#-------------------------

func damaged():
	is_running = false
	$"thermometer".hide()
	$"btn_action_repair".show()
	$"smoke".set_emitting(true)

	$"../tenant".set_dialogue()

	is_damaged = false


#-------------------------
# repaired
#-------------------------

func repair():
	health = 100
	is_running = true
	$"smoke".set_emitting(false)


#----------------------------------------------------------------------------------------------------
# _on_btn_action
#----------------------------------------------------------------------------------------------------

#-------------------------
# repaire
#-------------------------

func _on_btn_action_repair_pressed():
	p_financial.cash = p_financial.cash - 250
	repair()
	$"btn_action_repair".hide()
	$"thermometer".show()


#----------------------------------------------------------------------------------------------------
# end
#----------------------------------------------------------------------------------------------------
