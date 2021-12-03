TEST_INPUT = '00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010'

file = File.open('input.txt')
input = file.read
data_array = []
input.lines do |line|
    data_array << line.strip
end
p data_array

# OXYGEN

# data_array.first.length.times do |index|
#     if data_array.length == 2
#         p "INDEX = #{index}"
#         if data_array[0][index] != data_array[1][index]
#             data_array.delete_if { |binary| binary[index] == '0'}
#             break
#         end
#     end
#     zero_count = 0
#     one_count = 0
#     max = ''
#     data_array.each do |binary|
#         binary[index] == '0' ? zero_count += 1 : one_count += 1
#     end
#     zero_count > one_count ? max = '0' : max = '1'
#     p "MAX = #{max} === ZERO  #{zero_count}   ONE #{one_count}"
#     p '== DELETING == '
#     data_array.delete_if { |binary| binary[index] != max}
#     p data_array
# end
# p data_array.first.to_i(2)

# CO2

data_array.first.length.times do |index|
    if data_array.length == 2
        p "INDEX = #{index}"
        if data_array[0][index] != data_array[1][index]
            data_array.delete_if { |binary| binary[index] == '1'}
            break
        end
    end
    zero_count = 0
    one_count = 0
    min = ''
    data_array.each do |binary|
        binary[index] == '0' ? zero_count += 1 : one_count += 1
    end
    zero_count < one_count ? min = '0' : min = '1'
    p "MIN = #{min} === ZERO  #{zero_count}   ONE #{one_count}"
    p '== DELETING == '
    data_array.delete_if { |binary| binary[index] != min}
    p data_array
end
p data_array.first.to_i(2)

