#!/bin/sh
# To listen file change
inotifywait -q -m -e close_write ./sample/test.rb ./lib ./lib/rubyword ./lib/rubyword/writer/element  ./lib/rubyword/element ./lib/rubyword/style |
while read -r filename event; do
  ruby ./sample/test.rb
done