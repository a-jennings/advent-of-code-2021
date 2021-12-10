start_time = Time.now
file = File.open('input.txt')
input = file.read

def line_check(line)
    legal_chars = []
    chars = line.chars
    chars.each do |char|
        case char
        when '('
            legal_chars.unshift(')')
        when '['
            legal_chars.unshift(']')
        when '{'
            legal_chars.unshift('}')
        when '<'
            legal_chars.unshift('>')
        when ')'
            if legal_chars[0] == ')'
                legal_chars.delete_at(0)
            else
                return 3
                break
            end
        when ']'
            if legal_chars[0] == ']'
                legal_chars.delete_at(0)
            else
                return 57
                break
            end
        when '}'
            if legal_chars[0] == '}'
                legal_chars.delete_at(0)
            else
                return 1197
                break
            end
        when '>'
            if legal_chars[0] == '>'
                legal_chars.delete_at(0)
            else
                return 25137
                break
            end
        else
            return 0
        end
    
    end
end

arr = []
input.lines do |line|
    chars = line.strip
    arr << line_check(line)
end

puts "Answer: #{arr.sum}"
puts "Execution time: #{(Time.now - start_time).to_f.round(6)}s"