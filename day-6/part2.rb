file = File.open('input.txt')
input = file.read
start_time = Time.now

data = input.split(',')
data = data.map { |num| num.to_i }

babies = 0
rebirth = 0

hash = {}
(0..8).each do |key|
    hash[key] = 0
end

data.each do |num|
    hash[num] += 1
end

256.times do
    hash.each do |key, value|
        if key == 0
            babies += value
            rebirth += value
            hash[0] = 0
        else
            hash[key-1] = value
            hash[key] = 0
        end
    end
    hash[6] += rebirth
    rebirth = 0
    hash[8] += babies
    babies = 0
end

puts "Number of lanternfish after 256 days: #{hash.values.sum}"
puts "Execution time: #{(Time.now.to_f - start_time.to_f).round(6)}s"
