start_time = Time.now
file = File.open('input.txt')
input = file.read

graph = {}
data = []
input.lines.each do |line|
    data << line.strip.split('-')
end

data.each do |k, v|
    graph[k] = (graph[k] || []).push v
    graph[v] = (graph[v] || []).push k
end

paths = []
start = [["start"]]
while start.length > 0
    connected = []
    start.each do |path|
        graph[path[-1]].each do |opt|
            next if opt == 'start' || (opt != 'end' && opt.downcase == opt && path.include?(opt) && path.tally.filter {|k,v| k.downcase == k }.any? {|k,v| v >= 2 })
            if opt == 'end'
                paths << (path + [opt])
            else
                connected << (path + [opt])
            end
        end
    end
    start = connected

end

filtered = paths.filter {|path| path.filter {|str| str.downcase == str }.tally.values.all? {|value| value == 1 } }
puts "Answer: #{filtered.length}"
puts "Execution time: #{(Time.now - start_time).to_f.round(6)}s"