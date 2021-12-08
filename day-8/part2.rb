file = File.open('input.txt')
input = file.read

def number_solver(str)
    def find_six(arr, one)
        one = one.chars
        arr.filter_map do |chars|
            chars if !chars.chars.include?(one.first) || !chars.chars.include?(one.last)
        end
    end

    def find_zero_nine(arr, four)
        four = four.chars
        nine = nil
        arr.each do |chars|
            nine = chars if (chars.chars + four).uniq.length == chars.chars.length
        end
        arr.delete(nine)
        zero = arr.first
        return [zero, nine]
    end

    def find_two(arr, nine)
        nine = nine.chars
        two = nil
        arr.each do |chars|
            two = chars if (chars.chars + nine).uniq.length == 7
        end
        two
    end

    def find_three_five(arr, one)
        one = one.chars
        three = nil
        arr.each do |chars|
            three = chars if chars.chars.include?(one.first) && chars.chars.include?(one.last)
        end
        arr.delete(three)
        five = arr.first
        [three, five]
    end

    data = str.split
    data = data.map { |chars| chars.chars.sort.join}

    numbers = {1=> nil, 2=> nil, 3=> nil, 4=> nil, 5=> nil, 6=> nil, 7=> nil, 8=> nil, 9=> nil}
    # Get easily defined numbers
    data.each do |chars|
        case chars.length
        when 2
            numbers[1] = chars
        when 3
            numbers[7] = chars
        when 4
            numbers[4] = chars
        when 7
            numbers[8] = chars
        end
    end
    # Find six
    six_data = data.filter { |chars| chars.length == 6}
    numbers[6] = find_six(six_data, numbers[1]).first

    # Find zero and nine
    zero_nine_data = data.filter { |chars| chars.length == 6}
    zero_nine_data.delete(numbers[6])
    zero_nine = find_zero_nine(zero_nine_data, numbers[4])
    numbers[0] = zero_nine.first
    numbers[9] = zero_nine.last

    # Find two
    two_data = data.filter { |chars| chars.length == 5 }
    numbers[2] = find_two(two_data, numbers[9])

    # Find three and five
    three_five_data = data.filter { |chars| chars.length == 5 }
    three_five_data.delete(numbers[2])
    three_five = find_three_five(three_five_data, numbers[1])
    numbers[3] = three_five.first
    numbers[5] = three_five.last
    numbers
end

total = 0

input.lines do |line|
    data = line.strip.split(' | ')
    numbers = number_solver(data.first)
    num_str = []
    data.last.split(" ").each do |str|
        num_str << numbers.key(str.chars.sort.join)
    end
    final_num = num_str.last + (num_str.first * 1000) + (num_str[1] * 100) + (num_str[2] * 10)
    total += final_num
end

p total