code = File.read("README.md")[%r{<!-- example -->(.*)<!-- example -->}m].split("\n")[2..-3].join("\n")
puts code
eval code
