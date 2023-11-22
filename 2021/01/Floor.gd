extends Node2D

signal bounced(depth)

@export var _texture1: Texture2D
@export var _texture2: Texture2D

var _starting_depth = null
var _floor = []
var _fnl = FastNoiseLite.new()

func scan(x):
    x -= position.x - 50
    return _floor[x / 16.0]

# Called when the node enters the scene tree for the first time.
func _ready():
    var file = FileAccess.open('res://2021/01/input.txt', FileAccess.READ)
    var input = file.get_as_text()

    var lines = input.split('\n')
    var _starting_depth = int(lines[0])
    
    # Prep left-padding
    for x in range(0, 50):
        _floor.append(_starting_depth)
        
    for line in lines:
        _floor.append(int(line))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass

func _draw():
    for x in len(_floor):
        draw_texture(_texture(x), Vector2(x * 16, _floor[x]))

func _texture(x):
    if int(_fnl.get_noise_1d(x) * 100) % 2 == 0:
        return _texture1
    else:
        return _texture2

