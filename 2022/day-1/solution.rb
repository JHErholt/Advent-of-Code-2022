input = File.read("input.txt")
numbers = input.split("\n").map(&:to_i)

def sum_and_sort_numbers(numbers)
  numbers.chunk { |num| num.zero? }.to_a.reject { |arr| arr[0] == true}.map { |arr| arr[1].sum }.sort
end

def part_one(numbers)
  sum_and_sort_numbers(numbers).max
end

def part_two(numbers)
  sum_and_sort_numbers(numbers).last(3).sum
end

puts "part 1: #{part_one(numbers)}"
puts "part 2: #{part_two(numbers)}"