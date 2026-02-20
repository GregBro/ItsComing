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
