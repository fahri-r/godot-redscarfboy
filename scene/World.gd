extends Node

var MainInstances = ResourceLoader.MainInstances

onready var currentLevel = $Level/Level1
onready var level = $Level
onready var player = $Player
onready var healthbar = $UI/HealthBar

func _ready():
	MainInstances.Player.connect("level_complete", self, "_on_Player_level_complete")
	MainInstances.Player.connect("level_not_complete", self, "_on_Player_level_not_complete")
	MainInstances.Player.connect("game_complete", self, "_on_Player_game_complete")
	MainInstances.Player.connect("game_over", self, "_on_Game_Over")
	
	if LevelChanger.selectedLevel != null:
		LevelChanger.load_level(LevelChanger.selectedLevel, self)
	
	player.position = currentLevel.get_node("Position2D").position

func _process(_delta):
	$Player/Camera2D._auto_set_limits()

func change_level(finish_area):
	LevelChanger.change_level(finish_area, self)

func _on_Player_level_complete(finish_area):
	call_deferred("change_level", finish_area)

func _on_Game_Over():
	$UI/GameOverMenu.visible = true
	get_tree().paused = true

func _on_Player_level_not_complete():
	$UI/Label/AnimationPlayer.play("warning") 

func _on_Player_game_complete():
	LevelChanger.change_scene("res://scene/menu/GameOverMenu.tscn")
