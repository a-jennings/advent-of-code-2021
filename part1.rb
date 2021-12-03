file = File.open('input.txt')
input = file.read
data_array = []
gamma_rate = ''
epsilon_rate = ''
input.lines do |line|
    data_array << line.strip
end

data_array.first.length.times do |index|
    zero_count = 0
    one_count = 0
    data_array.each do |binary|
        binary[index] == '0' ? zero_count += 1 : one_count += 1
    end
    gamma_rate += zero_count > one_count ? '0' : '1'
    epsilon_rate += zero_count < one_count ? '0' : '1'
end

p gamma_rate.to_i(2) * epsilon_rate.to_i(2)

