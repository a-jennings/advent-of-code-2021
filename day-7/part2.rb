test_input = [16,1,2,0,4,2,7,1,2,14]

file = File.open('input.txt')
input = file.read
start_time = Time.now
data = input.split(',')
data.map! { |num| num.to_i }

# data = test_input # test

min = data.min
max = data.max
fuel_cost = 0
(min..max).each do |num|
    fuel_spent = 0
    data.each do |pos|
        fuel_spent += (1..(pos-num).abs).sum
    end
    fuel_cost = fuel_spent if fuel_cost.zero? || fuel_spent <= fuel_cost 
end

puts "Lowest possible fuel cost: #{fuel_cost}"
puts "Execution time: #{(Time.now - start_time).to_f.round(6)}s"