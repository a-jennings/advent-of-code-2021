file = File.open("input.txt")
input = file.read

depth = 0
horizontal = 0

input.lines do |line|
    command = line.strip.split
    p command
    if command[0] == 'down'
        depth += command[1].to_i
    elsif command[0] == 'up'
        depth -= command[1].to_i
    elsif command[0] == 'forward'
        horizontal += command[1].to_i
    end
end

p horizontal * depth