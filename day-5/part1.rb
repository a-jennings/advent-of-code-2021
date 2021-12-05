file = File.open('input.txt')
input = file.read

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
    end
    vents
end

coords = []
vents = []

input.lines do |line|
    coords << input_conversion(line)
end

coords.each do |coord|
    vents += vent_check(coord) if !vent_check(coord).empty?
end

p vents.length - vents.uniq.length