file = File.open('input.txt')
input = file.read


def oxygen_carbon_levels(input, gas_type)
    data = []
    input.lines do |line|
        data << line.strip
    end
    data.first.length.times do |index|
        if data.length == 2
            if data[0][index] != data[1][index]
                data.delete_if { |binary| binary[index] == (gas_type == 'oxygen' ? '0' : '1')}
                break
            end
        end
        zero_count = 0
        one_count = 0
        max = ''
        data.each do |binary|
            binary[index] == '0' ? zero_count += 1 : one_count += 1
        end
        zero_count > one_count ? max = '0' : max = '1'
        zero_count < one_count ? min = '0' : min = '1'
        data.delete_if { |binary| binary[index] != (gas_type == 'oxygen' ? max : min)}
    end
    data.first.to_i(2)
end

p oxygen_carbon_levels(input, 'oxygen') * oxygen_carbon_levels(input, 'carbon')




# OXYGEN



# CO2

# data_array.first.length.times do |index|
#     if data_array.length == 2
#         p "INDEX = #{index}"
#         if data_array[0][index] != data_array[1][index]
#             data_array.delete_if { |binary| binary[index] == '1'}
#             break
#         end
#     end
#     zero_count = 0
#     one_count = 0
#     min = ''
#     data_array.each do |binary|
#         binary[index] == '0' ? zero_count += 1 : one_count += 1
#     end
#     zero_count < one_count ? min = '0' : min = '1'
#     p "MIN = #{min} === ZERO  #{zero_count}   ONE #{one_count}"
#     p '== DELETING == '
#     data_array.delete_if { |binary| binary[index] != min}
#     p data_array
# end
# p data_array.first.to_i(2)


# 3597 OXYGEN
# 1389 CO2

# TOTAL = 4996233


