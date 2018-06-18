extends Node

#----------------------------------------------------------------------------------------------------
# globals
#----------------------------------------------------------------------------------------------------

var occupancy = {
	1:true,
	2:true,
	3:true,
	4:true,
	5:true,
	6:true,
	7:true,
	8:true,
	9:true,
	10:true,
	11:true
}

var occupancy_count = 0
var end_count = 1


#----------------------------------------------------------------------------------------------------
# _process
#----------------------------------------------------------------------------------------------------

func _process(delta):

	for i in occupancy:
		if (!occupancy[i]):
			occupancy_count += 1

	# Notification/HUD Purposes
	if (occupancy_count == end_count):
		print("%s people left" % end_count)
		$"hud/tenants".vacancy_count += 1
		end_count += 1

	if (occupancy_count == 11):
		print("GAME OVER")

	occupancy_count = 0


#----------------------------------------------------------------------------------------------------
# end
#----------------------------------------------------------------------------------------------------
