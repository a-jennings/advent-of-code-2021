start_time = Time.now
file = File.open('input.txt')
input = file.read
input_arr = []
input.lines do |line|
    input_arr << line.strip.chars.map { |num| num.to_i }
end

def increase_all(data)
    data = data.map do |line|
    line.map do |col|
        col + 1
    end
end

flashes = []
new_flashes = true

while new_flashes
    new_flashes = false
    data.each.with_index do |line, y|
      line.each.with_index do |col, x|
        if col > 9 && !flashes.include?([y, x])
          new_flashes = true
          flashes << [y, x]
          [-1, 0, 1].each do |dy|
            [-1, 0, 1].each do |dx|
              next if dy == 0 && dx == 0
              next if y + dy < 0 || y + dy >= 10
              next if x + dx < 0 || x + dx >= 10
              data[y + dy][x + dx] += 1
            end
          end
        end
      end
    end
  end
    data = data.map do |line|
        line.map { |col| col > 9 ? 0 : col }
    end
    [data, flashes.length]
end

steps = 0
while true do
    steps += 1
    input_arr, count = increase_all(input_arr)
    break if count == 100
end

puts "Steps: #{steps}"
puts "Execution time: #{(Time.now - start_time).to_f.round(6)}s"