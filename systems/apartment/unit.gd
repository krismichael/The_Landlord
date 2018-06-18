extends Node2D

#----------------------------------------------------------------------------------------------------
# globals
#----------------------------------------------------------------------------------------------------

onready var w_clock = $"/root/gx/world/clock"
onready var w_temperature_curr = $"/root/gx/world/weather".temperature_curr

onready var p_financial = $"/root/gx/player/data/financial"

export var apartment_number = 0

export var value = 0
var occupied = true

var airconditioner = false
var temperature_curr = 0

var day_next = 0
var month_next = 0


#----------------------------------------------------------------------------------------------------
# _ready
#----------------------------------------------------------------------------------------------------

func _ready():
	day_next = w_clock.time_days + 1


#----------------------------------------------------------------------------------------------------
# _process
#----------------------------------------------------------------------------------------------------

func _process(delta):

	if (!occupied):
		$"windows".set_modulate(Color(0.25, 0.25, 0.25, 1))
	else:
		$"windows".set_modulate(Color(0.5, 0.5, 1.5, 1))

	$"rent".set_text(str("+$%s" % $"tenant".rent))

	if (w_clock.time_months == month_next):
		if (occupied):
			set_payment()

		month_next = w_clock.time_months + 1


#----------------------------------------------------------------------------------------------------
# set_payment
#----------------------------------------------------------------------------------------------------

func set_payment():
	p_financial.cash = p_financial.cash + $"tenant".rent
	$"animation".play("rent_paid")


#----------------------------------------------------------------------------------------------------
# end
#----------------------------------------------------------------------------------------------------
