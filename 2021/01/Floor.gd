extends Node2D

@export var _texture: Texture2D

var _starting_depth = null
var _floor = []

# Called when the node enters the scene tree for the first time.
func _ready():
    var file = FileAccess.open('res://2021/01/test.txt', FileAccess.READ)
    var input = file.get_as_text()

    var lines = input.split('\n')
    var _starting_depth = int(lines[0])
    
    # Prep left-padding
    for x in range(0, 20):
        _floor.append(_starting_depth)
        
    for line in lines:
        _floor.append(int(line))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass

func _draw():
    for x in len(_floor):
        draw_texture(_texture, Vector2(x * 16, _floor[x]))
