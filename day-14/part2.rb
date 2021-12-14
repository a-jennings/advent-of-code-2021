start_time = Time.now
file = File.open('input.txt')
input = file.read

template = ''
rules = []
index = 0
input.lines do |line|
    if index ==  0
        template = line.strip
        index += 1
    elsif line.length == 1 
        next
    else
        rules << line.strip.split(' -> ')
    end
end

rules.each do |rule|
    p rule
end
