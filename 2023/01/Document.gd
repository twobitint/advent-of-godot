extends Label

@onready var _output = get_node('/root/PartOne/Canvas/Output')

var _sum = 0

# Called when the node enters the scene tree for the first time.
func _ready():
    var file = FileAccess.open('res://2023/01/input.txt', FileAccess.READ)
    var input = file.get_as_text().left(-1) # Remove extra \n at eof
    self.text = input

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var split = self.text.split('\n', false, 1)
        
    if split.size() > 1:
        self.text = split[1]    
        
    var line = _part2(split[0])
    var first = null
    var last = null
    for char in line.split(''):
        if char.is_valid_int():
            if first == null:
                first = char
            last = char
    _sum += int(first + last)
    _output.text = "Sum: %d" % _sum 
    
    if split.size() == 1:
        queue_free()
        return
    
func _part2(line: String) -> String:
    var map = {
        "one": "o1e",
        "two": "t2",
        "three": "t3e",
        "four": "4",
        "five": "5e",
        "six": "6",
        "seven": "7n",
        "eight": "e8t",
        "nine": "n9e",
    }
    for num in map:
        line = line.replace(num, map[num])
    return line    
    
