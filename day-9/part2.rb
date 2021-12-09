start_time = Time.now
file = File.open('input.txt')
input = file.read

def is_low_point?(row, index, data)
    num = data[row][index]
    top = data.has_key?(row-1) ? data[row-1][index] : 9
    bottom = data.has_key?(row+1) ? data[row+1][index] : 9
    left = data[row][index-1] || 9
    right = data[row][index+1] || 9
    num < top && num < bottom && num < left && num < right
end

def basin(row, col, data)
    basin_array = [[row,col]]
    basin_array.each do |coord|
        row = coord.first
        col = coord.last
        top = data.has_key?(row-1) ? data[row-1][col] : 9
        bottom = data.has_key?(row+1) ? data[row+1][col] : 9
        left = data[row][col-1] || 9
        right = data[row][col+1] || 9

        # p "[#{row}, #{col}] -- T: #{top} - B: #{bottom} - L: #{left} - R: #{right}"

        if top != 9
            basin_array << [(row-1 < 0 ? 0 : row-1), col] unless basin_array.include?([(row-1 < 0 ? 0 : row-1), col])
        end
        if bottom != 9
            basin_array << [row+1, col] unless basin_array.include?([row+1, col])
        end
        if left != 9
            basin_array << [row, (col-1 < 0 ? 0 : col - 1)] unless basin_array.include?([row, (col-1 < 0 ? 0 : col - 1)])
        end
        if right != 9 
            basin_array << [row, col+1] unless basin_array.include?([row, col+1])
        end
    end
    # p basin_array
    # sleep(1)
    basin_array
end


count = 0
data = {}
input.lines do |line|
    data[count] = line.strip.chars.map { |num| num.to_i }
    count += 1
end
low_points = []
data.each do |entry|
    entry.last.each_with_index do |num, index|
        low_points << [entry.first, index] if is_low_point?(entry.first, index, data)
    end
end

basins = []
low_points.each do |low_point|
    basins << basin(low_point.first, low_point.last, data)
end
basin_size = basins.map do |basin|
    basin.length
end

max_three = basin_size.max(3)

puts "Answer: #{max_three.inject(:*)}"
puts "Execution time: #{(Time.now - start_time).to_f.round(6)}s"