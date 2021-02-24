extends Node2D
var playerList = load("res://CyclicList.gd").new()

func _ready():
	setup_game()
	playerList.start.data.play_turn()

# populates the player list
func setup_game():
	var team = get_node("Characters/Team")
	var enemies = get_node("Characters/Enemies")
	var teamSize = team.get_child_count()
	var enemySize = enemies.get_child_count()
	# in future, max concurrent team/enemy plays = other*2 + 1
	# eg if T = 1 and E = 4, Max E in a row = 3
	# Currently, team then enemies
	for player in team.get_children():
		playerList.append(player)
	for player in enemies.get_children():
		playerList.append(player)

func on_turn_ended():
	print("turn over")

func _exit_tree():
	# Clear refernece to prevent memory leak
	playerList = null
