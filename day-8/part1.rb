start_time = Time.now
file = File.open('input.txt')
input = file.read
counter = 0
input.lines do |line|
    data = line.strip.split('|')[1].strip.split(" ")
    data.each do |chars|
        valid_lengths = [2, 3, 4, 7]
        counter += 1 if valid_lengths.include?(chars.length)
    end
end
puts "Answer: #{counter}"
puts "Execution time: #{(Time.now - start_time).to_f.round(6)}s"