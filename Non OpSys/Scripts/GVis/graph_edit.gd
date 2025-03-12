extends GraphEdit

var node := GraphNode.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(node)
	node.position_offset.x = get_viewport().get_mouse_position().x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
