file = File.open('input.txt')
input = file.read
num_array = []
counter = 0

input.lines do |line|
    num_array << line.strip.to_i
end

num_array.each_with_index do |num, index|
    break if num_array[index + 3].nil?
    current_num = num + num_array[index + 1] + num_array[index + 2]
    next_num= num_array[index + 1] + num_array[index + 2] + num_array[index + 3]
    counter += 1 if next_num > current_num
end

p counter