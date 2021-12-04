file = File.open('input.txt')
input = file.read

data = []
score = 0
input.lines do |line|
    data << line.strip.split(" ")
end
drawn_numbers = data[0][0].split(',')
data.delete_at(0)
data.delete_if{ |array| array.empty? }
bingo_cards = data.each_slice(5).to_a

def card_checker(card)
    card.each do |line|
        if line.all? { |char| char.include?('X') }
            return card
        end
    end
    5.times do |index|
        vertical_line = []
        card.each do |line|
            vertical_line << line[index]
        end
        if vertical_line.all? { |char| char.include?('X') }
            return card
        end
    end
    return []
end

def check_score(card)
    total = 0
    card.each do |line|
        line.each do |num|
            next if num.include?('X')
            total += num.to_i
        end
    end
    total
end

drawn_numbers.each do |drawn_num|
    break if !score.zero?

    bingo_cards.each do |card|
        card.each do |line|
            line.each do |line_num|
                line_num.concat('X') if line_num == drawn_num
            end
        end
        if card_checker(card).length == 5
            score = check_score(card) * drawn_num.to_i
        end
    end
end
p score
