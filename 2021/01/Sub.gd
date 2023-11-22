extends CharacterBody2D

@onready var _floor = get_node("/root/DayOne/Floor")
@onready var _output = get_node("/root/DayOne/Canvas/Output")

var _last_depth = 999999
var _increases = 0

const SPEED = 40000 
const FLOAT = 50 # Try to stay this far above floor
const WIDTH = 16 # Scanner resolution width

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var target_depth = _floor.scan(position.x)
    _output.depth = target_depth
    
    # if _last_depth == null:
    #     _last_depth = depth
        
    # if _last_depth < depth:
    #     _increases += 1
    #     _output.count = _increases
    
    var target = target_depth - FLOAT
    velocity = position.direction_to(Vector2(position.x + 200, target)) * delta * SPEED
        
    var x0 = position.x
        
    move_and_slide()
    # _last_depth = depth

    var x1 = position.x
    
    for x in range(x0, x1):
        var depth = _floor.scan(x)
        if depth > _last_depth:
            _increases += 1
            _output.count = _increases
        _last_depth = depth
