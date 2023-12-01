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
        
    var line = split[0]
    _sum += int(_scan(line) + _scan(line, true))
    _output.text = "Sum: %d" % _sum 
    
    if split.size() == 1:
        queue_free()
        return
    
func _scan(line, reverse = false):
    var words = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
    
    if reverse:
        line = Santa.string_reverse(line)
        for i in words.size():
            words[i] = Santa.string_reverse(words[i])
    
    var tracker = ''
    var i = -1
    var chars = line.split('')
    while i < chars.size():
        i += 1
        var char = chars[i]
        if char.is_valid_int():
            return char
        else:
            tracker += char
            var on_track = false
            for j in words.size():
                var word = words[j]
                if word == tracker:
                    return str(j + 1)
                if Santa.string_starts_with(word, tracker):
                    on_track = true
            if not on_track:
                i -= tracker.length() - 1
                tracker = ''
