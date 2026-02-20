extends Area3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("jewel")
	animation_player.play("Idle")


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") :
		body.player_wins()
