extends Control

@onready var you_lose_label: Label = $CenterContainer/VBoxContainer/YouLoseLabel
@onready var you_win_label: Label = $CenterContainer/VBoxContainer/YouWinLabel

func _on_new_game_button_pressed() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	you_lose_label.visible = false
	you_win_label.visible = false
	self.visible = false
	get_tree().paused = false
	get_tree().reload_current_scene()
	

func _on_exit_game_button_pressed() -> void:
	get_tree().quit()

func game_over() -> void :
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	self.visible = true
	get_tree().paused = true
	you_lose_label.visible = true
	you_win_label.visible = false

func you_win() -> void :
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	self.visible = true
	get_tree().paused = true
	you_lose_label.visible = false
	you_win_label.visible = true
