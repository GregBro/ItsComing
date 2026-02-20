extends Node3D


@onready var door_body: StaticBody3D = $DoorBody
@onready var open_position: Node3D = $OpenPosition
@onready var closed_position: Node3D = $ClosedPosition
@onready var door_text_1: Sprite3D = $DoorBody/DoorText1
@onready var door_text_2: Sprite3D = $DoorBody/DoorText2


var is_active :bool = false
var player

func _ready() -> void:
	MsgQueue.connect("open_all_doors", open_door)
	MsgQueue.connect("close_all_doors", close_door)
	

func open_door() :
	var tween = create_tween()
	tween.tween_property(door_body,"position",open_position.position,1.0)
	
	
func close_door() :
	var tween = create_tween()
	tween.tween_property(door_body,"position",closed_position.position,1.0)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#if is_active :
		#pass

func _input(event: InputEvent) -> void:
	if is_active :
		if event.is_action_pressed("enter_door"):
			open_door()
		if event.is_action_pressed("close_door"):
			close_door()
		if event.is_action_pressed("teleport"):
			player = get_tree().get_first_node_in_group("player")
			player.position = Globals.get_random_position()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") :
		is_active = true
		#print("Entered")
		var tween = create_tween()
		var tween2 = create_tween()
		tween.parallel().tween_property(door_text_1,"modulate:a",1.0,0.5)
		tween2.parallel().tween_property(door_text_2,"modulate:a",1.0,0.5)


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("player") :
		is_active = false
		var tween = create_tween()
		var tween2 = create_tween()
		tween.parallel().tween_property(door_text_1,"modulate:a",0.0,0.2)
		tween2.parallel().tween_property(door_text_2,"modulate:a",0.0,0.2)
