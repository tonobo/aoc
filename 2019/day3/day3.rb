$matrix = []

def add_wire(path)
  x, y = [0, 0]
  wire = []
  path.split(',').each do |step|
    case step
    when /R(\d+)/ then $1.to_i.times{wire << [x+=1,y]}
    when /L(\d+)/ then $1.to_i.times{wire << [x-=1,y]}
    when /U(\d+)/ then $1.to_i.times{wire << [x,y+=1]}
    when /D(\d+)/ then $1.to_i.times{wire << [x,y-=1]}
    end
  end
  $matrix << wire
end


STDIN.readlines.to_a.each{ |wire| add_wire(wire) unless wire.strip.empty? }
intersections = ($matrix[0] & $matrix[1]).uniq
p intersections.map{|a,b| a.abs + b.abs }.sort[0]
p intersections.map.with_index { |point, i| $matrix.sum{|w| w.index(point) + 1}}.sort[0]
