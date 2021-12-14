start_time = Time.now
file = File.open('input.txt')
input = file.read

template = ''
rules = []
index = 0
input.lines do |line|
    if index ==  0
        template = line.strip
        index += 1
    elsif line.length == 1 
        next
    else
        rules << line.strip.split(' -> ')
    end
end

new_rules = {}

rules.each do |key, value|
    new_rules[key] = [key[0] + value, value + key[1]]
end 

char_list = {}

template.chars.each_with_index do |char, index|
    polymer = char + (template[index+1].nil? ? "" : template[index+1])
    break if polymer.length == 1
    if char_list.has_key?(polymer)
        char_list[polymer] += 1
    else
        char_list[polymer] = 1
    end
end

40.times do
    char_list_additions = {}

    char_list.each do |key, value|
        polymers = new_rules[key]
        polymers.each do |polymer|
            if char_list_additions.has_key?(polymer)
                char_list_additions[polymer] += (1 * value)
            else
                char_list_additions[polymer] = (1 * value)
            end
        end
    end
    char_list = char_list_additions

end

char_tally = {}
char_list.each do |key, value|
    if char_tally.has_key?(key[0])
        char_tally[key[0]] += value
    else
        char_tally[key[0]] = value
    end

    if char_tally.has_key?(key[1])
        char_tally[key[1]] += value
    else
        char_tally[key[1]] = value
    end
    # p char_tally
end

final_tally = {}

char_tally.each do |key, value|
    final_tally[key] = (value / 2.0).ceil
end

puts "Answer: #{(final_tally.values.max - final_tally.values.min)}"
puts "Execution time: #{(Time.now - start_time).to_f.round(6)}s"