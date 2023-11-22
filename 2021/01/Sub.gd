extends CharacterBody2D

@onready var _floor = get_node("/root/DayOne/Floor")
@onready var _output = get_node("/root/DayOne/Canvas/Output")

var _last_depth = 999999
var _increases = 0

const SPEED = 40000 
const FLOAT = 50 # Try to stay this far above floor
const HEADING = 200 # Forward target

func _process(delta):
    var target_depth = _floor.scan(position.x) - FLOAT
    _output.depth = target_depth
    
    var target = Vector2(position.x + HEADING, target_depth)
    velocity = position.direction_to(target) * delta * SPEED
        
    var x0 = position.x
    move_and_slide()
    var x1 = position.x
    
    for x in range(x0, x1):
        var depth = _floor.scan(x)
        if depth > _last_depth:
            _increases += 1
            _output.count = _increases
        _last_depth = depth
