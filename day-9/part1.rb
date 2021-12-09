start_time = Time.now
file = File.open('input.txt')
input = file.read

def is_low_point?(row, index, data)
    num = data[row][index]
    top = data.has_key?(row-1) ? data[row-1][index] : 10
    bottom = data.has_key?(row+1) ? data[row+1][index] : 10
    left = data[row][index-1] || 10
    right = data[row][index+1] || 10
    num < top && num < bottom && num < left && num < right
end
count = 0
data = {}
input.lines do |line|
    data[count] = line.strip.chars.map { |num| num.to_i }
    count += 1
end

total = 0

data.each do |entry|
    entry.last.each_with_index do |num, index|
        total += num + 1 if is_low_point?(entry.first, index, data)
    end
end

puts "Sum of lowest points: #{total}"
puts "Execution time: #{(Time.now - start_time).to_f.round(6)}s"