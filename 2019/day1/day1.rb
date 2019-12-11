p STDIN.read.split.sum{ |mass| mass.to_i/3-2}
p STDIN.read.split.sum{ |mass| total = 0; while (c = mass.to_i/3-2).positive?; total += c; mass = c; end; total }
