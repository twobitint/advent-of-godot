extends Node2D

signal bounced(depth)

@export var _texture1: Texture2D
@export var _texture2: Texture2D

var _floor = []
var _fnl = FastNoiseLite.new()
var _endx = 0

const WIDTH = 16

func scan(x):
    return _floor[x / WIDTH]
    
func is_done(x):
    return x / WIDTH >= _endx

# Called when the node enters the scene tree for the first time.
func _ready():
    var file = FileAccess.open('res://2021/01/input.txt', FileAccess.READ)
    var input = file.get_as_text().left(-1) # Remove extra \n at eof

    var left_pad = 100
    var right_pad = 200
    var lines = input.split('\n')
    var depth0 = int(lines[0])
    var depth1 = int(lines[len(lines) - 1])
    _endx = len(lines) - 1 + left_pad
    
    # Left padding
    for x in range(0, left_pad):
        _floor.append(depth0)
        
    # Real input data
    for line in lines:
        _floor.append(int(line))
        
    # Right padding
    for x in range(0, right_pad):
        _floor.append(depth1)

func _draw():
    for x in len(_floor):
        draw_texture(_texture(x), Vector2(x * WIDTH, _floor[x]))

func _texture(x):
    if int(_fnl.get_noise_1d(x) * 100) % 2 == 0:
        return _texture1
    else:
        return _texture2

