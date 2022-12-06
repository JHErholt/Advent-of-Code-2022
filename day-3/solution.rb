input = File.read("input.txt")
rucksacks = input.split("\n")

POINTS = {}
points_arr = []
("a".."z").to_a.each { |letter| points_arr << letter}
("A".."Z").to_a.each { |letter| points_arr << letter}
points_arr.each_with_index { |letter, i| POINTS[letter] = i + 1}

def part_one(rucksacks)
  part_one = rucksacks.map { |rucksack| rucksack.chars.each_slice(rucksack.length / 2).map(&:join) }
  part_one
    .map { |rucksack| POINTS[rucksack[0].chars.select { |letter| rucksack[1].chars.include?(letter) }.uniq.join] }
    .sum
end

def part_two(rucksacks)
  part_two = rucksacks
  part_two
    .each_slice(3)
    .to_a
    .map { |group_of_rucksacks| POINTS[group_of_rucksacks[0].chars.select { |letter| group_of_rucksacks[1].chars.include?(letter) }.select { |letter| group_of_rucksacks[2].chars.include?(letter) }.uniq.join] }
    .sum
end

puts "part 1: #{part_one(rucksacks)}"
puts "part 2: #{part_two(rucksacks)}"