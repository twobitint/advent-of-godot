extends Node

func string_reverse(s: String) -> String:
    var r = ''
    for i in s.length():
        r = str(r, s[s.length() - i - 1])
    return r

func string_starts_with(s: String, find: String) -> bool:
    return s.find(find) == 0

func string_replace_first(s: String, find: String, replace: String) -> String:
    var length = find.length()
    var i = 0
    while i < s.length() - length:
        var piece = ''
        var j = i
        while j < i + length:
            piece += s[j]
            j += 1
        if piece == find:
            return s.substr(0, j - length) + replace + s.substr(j)
        i += 1
    return s
