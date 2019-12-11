
c = STDIN.read.split(',').map(&:to_i); c[1]=12; c[2] = 2

def solve(data, pos = 0)
  op, a, b, ref = *data[pos, 4]
  return data if op == 99
  data[ref] = data[a].send(op == 1 ? :+ : :*, data[b])
  solve(data, pos + 4)
end

p solve(c.dup)[0]
100_000.times { |i| x = c.dup; x[1] = i / 100; x[2] = i % 100; break p(100*x[1]+x[2]) if solve(x)[0] == 19690720 }

