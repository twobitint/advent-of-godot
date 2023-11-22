extends RichTextLabel

var depth = 0
var count = 0

func _process(_delta):
    text = "Depth: %d\nIncreases: %d" % [depth, count]
