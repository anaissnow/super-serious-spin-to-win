extends TextureRect

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func rotate_zero():
	animation_player.play("rotation 0")

func rotate_ninety():
	animation_player.play("rotation 90")

func rotate_anticlockwise_zero():
	animation_player.play_backwards("rotation 0")

func rotate_anticlockwise_ninety():
	animation_player.play_backwards("rotation 90")
