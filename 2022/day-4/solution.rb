input = File.read("input.txt")
pairs = input
  .split("\n")
  .map { |group| group.split(",").map { |section| (section.split("-")[0].to_i..section.split("-")[1].to_i).to_a } }

def part_one(pairs)
  pairs
    .select { |pair| true if (pair[0] - pair[1]).empty? || (pair[1] - pair[0]).empty? }
    .length
end

def part_two(pairs)
  pairs
    .select { |pair| true if (pair[0] - pair[1]).length != pair[0].length }
    .length
end

puts "part 1: #{part_one(pairs)}"
puts "part 2: #{part_two(pairs)}"