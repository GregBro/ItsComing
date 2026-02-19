extends Node3D

@onready var door_body: RigidBody3D = $DoorBody
@onready var open_position: Node3D = $OpenPosition
@onready var closed_position: Node3D = $ClosedPosition

var is_active :bool = false

func _ready() -> void:
	MsgQueue.connect("open_all_doors", open_door)
	MsgQueue.connect("close_all_doors", close_door)

func open_door() :
	lerp(door_body.position,open_position,1.0)
	
func close_door() :
	lerp(door_body.position,closed_position,1.0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_active :
		pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") :
		is_active = true


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("player") :
		is_active = false
