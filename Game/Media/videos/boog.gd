extends Area

signal weentrigger

func _ready() -> void:
	pass

func interact():
	emit_signal("weentrigger")
	queue_free()
