extends CharacterBody2D

var _last_depth = null
var _increase_counter = 0

var _speed = 20000

# Called when the node enters the scene tree for the first time.
func _ready():
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var depth = get_node("/root/DayOne/Floor").scan(position.x)
    $Label.text = "Depth: %d" % depth
    get_node("/root/DayOne/Canvas/Output").depth = depth
    
    if _last_depth == null:
        _last_depth = depth
        
    if _last_depth < depth:
        _increase_counter += 1
        get_node("/root/DayOne/Canvas/Output").count = _increase_counter
    
    var target = depth - 50
    
    velocity = position.direction_to(Vector2(position.x + 200, target)) * delta * _speed
        
    # move_toward()
        
    move_and_slide()
    _last_depth = depth
