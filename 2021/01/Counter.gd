extends RichTextLabel

var depth = 0
var count = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    text = "Depth: %d\nIncreases: %d" % [depth, count]
