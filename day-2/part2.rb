file = File.open("input.txt")
input = file.read

depth = 0
horizontal = 0
aim = 0

input.lines do |line|
    command = line.strip.split
    if command[0] == 'down'
        aim += command[1].to_i
    elsif command[0] == 'up'
        aim -= command[1].to_i
    elsif command[0] == 'forward'
        horizontal += command[1].to_i
        depth += (aim * command[1].to_i)
    end
end

p horizontal * depth