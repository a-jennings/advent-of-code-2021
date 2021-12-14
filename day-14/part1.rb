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

template = template.chars

10.times do 
    skip = false
    template.each_with_index do |char, index|
        polymer = char + (template[index+1].nil? ? "" : template[index+1])
        if skip == true
            skip = false
            next
        end
        rules.each do |rule|
            if polymer == rule.first
                skip = true
                template.insert(index+1, rule.last)
                break
            end
        end
    end
end

puts "Answer: #{template.tally.values.max - template.tally.values.min}"
puts "Execution time: #{(Time.now - start_time).to_f.round(6)}s"