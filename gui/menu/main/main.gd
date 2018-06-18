extends Control

#----------------------------------------------------------------------------------------------------
#
#----------------------------------------------------------------------------------------------------

var game = load("res://systems/game/game.tscn")


#----------------------------------------------------------------------------------------------------
# _on_btn_pressed
#----------------------------------------------------------------------------------------------------

#-------------------------
# game_continue
#-------------------------

func _on_btn_game_continue_pressed():
	pass # replace with function body


#-------------------------
# game_new
#-------------------------

func _on_btn_game_new_pressed():
	$"/root".add_child(game.instance())
	queue_free()

#-------------------------
# menu_load
#-------------------------

func _on_btn_menu_load_pressed():
	pass # replace with function body


#-------------------------
# menu_settings
#-------------------------

func _on_btn_menu_settings_pressed():
	pass # replace with function body


#-------------------------
# menu_extras
#-------------------------

func _on_btn_menu_extras_pressed():
	pass # replace with function body


#-------------------------
# action_quit
#-------------------------

func _on_btn_action_quit_pressed():
	get_tree().quit()


#----------------------------------------------------------------------------------------------------
# end
#----------------------------------------------------------------------------------------------------


func _on_btn_menu_instructions2_pressed():
	$"../tutorial".show()
