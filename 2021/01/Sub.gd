extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
    apply_force(Vector2.RIGHT * 10000)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass
