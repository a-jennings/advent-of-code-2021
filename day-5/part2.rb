file = File.open('input.txt')
input = file.read
start_time = Time.now

def input_conversion(input_line)
    x = input_line.match(/(\d+,\d+)/).to_s
    x = x.split(',')
    x = [x[0].to_i, x[1].to_i]

    y = input_line.match(/-> (\d+,\d+)/).to_s
    y = y.slice(3..).split(',')
    y = [y[0].to_i, y[1].to_i]
    
    [x,y]
end

def vent_check(coord)
    x1 = coord[0][0]
    x2 = coord[1][0]
    y1 = coord[0][1]
    y2 = coord[1][1]
    vents = []
    if x1 == x2
        range = ([y1, y2].min..[y1, y2].max).to_a
        range.each do |y|
            vents << [x1,y] 
        end 
    elsif y1 == y2
        range = ([x1, x2].min..[x1, x2].max).to_a
        range.each do |x|
            vents << [x,y1]
        end
    else
        xrange = (x1..x2).to_a
        yrange = (y1..y2).to_a
        xrange = (x2..x1).to_a.reverse if xrange.empty?
        yrange = (y2..y1).to_a.reverse if yrange.empty?
        xrange.each_with_index do |x, index|
            vents << [x, yrange[index]]
        end
    end
    vents
end

coords = []
vents = []

input.lines do |line|
    coords << input_conversion(line)
end

coords.each do |coord|
    vents += vent_check(coord)
end

hash = {}
dupes = []

vents.each do |vent|
    if hash.has_key?(vent)
        hash[vent] += 1
    else
        hash[vent] = 1
    end
end

hash.each do |key, value|
    dupes << [key,value] if value > 1
end

puts "Number of crossover points: #{dupes.length}"
end_time = Time.now
puts "Execution time: #{(end_time.to_f - start_time.to_f).round(2)}s"