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
                return nil
                break
            end
        when ']'
            if legal_chars[0] == ']'
                legal_chars.delete_at(0)
            else
                return nil
                break
            end
        when '}'
            if legal_chars[0] == '}'
                legal_chars.delete_at(0)
            else
                return nil
                break
            end
        when '>'
            if legal_chars[0] == '>'
                legal_chars.delete_at(0)
            else
                return nil
                break
            end
        end
    end
    return legal_chars
end

def score(arr)
    score = 0
    arr.each do |char|
        score *= 5
        case char
        when ')'
            score += 1
        when ']'
            score += 2            
        when '}'
            score += 3
        when '>'
            score += 4
        end
    end
    return score
end

output_arr = []
input.lines do |line|
    output_arr << line_check(line.strip)
end

output_arr.delete(nil)

all_scores = output_arr.map do |output|
    score(output)
end

puts "Answer: #{all_scores.sort[all_scores.length/2]}"
puts "Execution time: #{(Time.now - start_time).to_f.round(6)}s"