extends CanvasLayer

func _ready():
	hide()

func _on_player_player_died():
	show()
