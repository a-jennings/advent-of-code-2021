start_time = Time.now
file = File.open('input.txt')
input = file.read

data = input.lines.filter_map do |line|
    line.strip.split(',') if !line.include?('fold along') 
end
data.delete([])
coords = data.map do |coord|
    [coord.first.to_i, coord.last.to_i]
end
commands = []
input.lines do |line|
    if line.include?('fold along')
        command = line.strip.split('=') 
        commands << [command.first[-1], command.last.to_i]
    end
end
commands = [commands.first]

commands.each do |fold|
    fold_direction = fold.first
    fold_axis = fold.last
    if fold_direction == 'x'
        coords.each do |coord|
            dist_from_axis = coord.first - fold_axis
            coords << [(fold_axis - dist_from_axis), coord.last] if coord.first > fold_axis
        end
        coords = coords.select { |coord| coord.first < fold_axis}
    elsif fold_direction == 'y'
        coords.each do |coord|
            dist_from_axis = coord.last - fold_axis
            coords << [coord.first, (fold_axis - dist_from_axis)] if coord.last > fold_axis
        end
        coords = coords.select { |coord| coord.last < fold_axis}
    end
end

puts "Number of dots: #{coords.uniq.length}"
puts "Execution time: #{(Time.now - start_time).to_f.round(6)}s"