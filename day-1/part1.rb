file = File.open('input.txt')
input = file.read
num_array = []
counter = 0

input.lines do |line|
    num_array << line.strip.to_i
end

num_array.each_with_index do |num, index|
    break if num_array[index + 1].nil?
    counter += 1 if num_array[index + 1] > num
end

p counter