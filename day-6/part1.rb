file = File.open('input.txt')
input = file.read
start_time = Time.now

data = input.split(',')
data = data.map { |num| num.to_i }
new_data = []
new_count = 0

80.times do
    data.each do |num|
        if num == 0
            new_data << 6
            new_count += 1
        else
            new_data << num - 1
        end
    end
    if new_count.positive?
        new_count.times do
            new_data << 8
            new_count -= 1
        end
    end
    data = new_data
    new_data = []
end

puts "Number of lanternfish after 80 days: #{data.length}"
puts "Execution time: #{(Time.now.to_f - start_time.to_f).round(2)}s"
