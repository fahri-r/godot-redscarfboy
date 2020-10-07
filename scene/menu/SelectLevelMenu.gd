extends Control

var MainInstances = ResourceLoader.MainInstances

func _ready():
	var buttons = get_node("VBoxContainer/CenterContainer/ButtonContainer").get_children()
	var completed_level = SaverandLoader.custom_data.completed_level
	
	if completed_level > 0:
		for button in buttons:
			button.disabled = false
			if button.name == str(completed_level):
				break

func _on_1_pressed():
	LevelChanger.selectedLevel = "res://scene/level/Level 1.tscn"
	LevelChanger.load_scene("res://scene/World.tscn")

func _on_2_pressed():
	LevelChanger.selectedLevel = "res://scene/level/Level 2.tscn"
	LevelChanger.load_scene("res://scene/World.tscn")

func _on_3_pressed():
	LevelChanger.selectedLevel = "res://scene/level/Level 3.tscn"
	LevelChanger.load_scene("res://scene/World.tscn")

func _on_4_pressed():
	LevelChanger.selectedLevel = "res://scene/level/Level 4.tscn"
	LevelChanger.load_scene("res://scene/World.tscn")
