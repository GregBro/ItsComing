extends Node

var location_dictionary

func _ready():
	var file = "res://Levels/Assets/LocationData.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	location_dictionary = JSON.parse_string(json_as_text)

func get_random_position() -> Vector3 :
	var size = location_dictionary.size()
	var index = randi_range(0,size-1)
	var data_set = location_dictionary[index].PlayerLocation
	var  new_position :Vector3  =  Vector3(data_set[0], data_set[1],data_set[2])
	#print(new_position)
	return new_position

func setup_random_positions() -> void:
		var size = location_dictionary.size()
		var index = randi_range(0,size-1)
		var data_set = location_dictionary[index]
		var player = get_tree().get_first_node_in_group("player")
		player.position = Vector3(data_set.PlayerLocation[0], data_set.PlayerLocation[1],data_set.PlayerLocation[2])
		var enemy = get_tree().get_first_node_in_group("enemy")
		enemy.position = Vector3(data_set.EnemyLocation[0], data_set.EnemyLocation[1],data_set.EnemyLocation[2])
		var jewel = get_tree().get_first_node_in_group("jewel")
		jewel.position = Vector3(data_set.JewelLocation[0], data_set.JewelLocation[1],data_set.JewelLocation[2])
