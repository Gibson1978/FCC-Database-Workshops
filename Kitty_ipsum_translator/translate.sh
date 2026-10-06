#!/bin/bash
# sed 's/word to find/word to replace/' | -E for extended regex 
# grep 'word to find' | --color for highlights | -o to display only finding | -c for count of lines | -n for line number
# wc to display count of words, byte and lines | -w for words only | -l for lines only | -m for characters only

cat $1 | sed -E 's/catnip/dogchow/g; s/cat/dog/g; s/meow|meowzer/woof/g' 