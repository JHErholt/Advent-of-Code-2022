input = File.read("input.txt")
instructions = input.split("\n")

# [P]     [C]         [M]            
# [D]     [P] [B]     [V] [S]        
# [Q] [V] [R] [V]     [G] [B]        
# [R] [W] [G] [J]     [T] [M]     [V]
# [V] [Q] [Q] [F] [C] [N] [V]     [W]
# [B] [Z] [Z] [H] [L] [P] [L] [J] [N]
# [H] [D] [L] [D] [W] [R] [R] [P] [C]
# [F] [L] [H] [R] [Z] [J] [J] [D] [D]
#  1   2   3   4   5   6   7   8   9 


def part_one(instructions)
  part_one_stacks = {
    "1" => %w[F H B V R Q D P],
    "2" => %w[L D Z Q W V],
    "3" => %w[H L Z Q G R P C],
    "4" => %w[R D H F J V B],
    "5" => %w[Z W L C],
    "6" => %w[J R P N T G V M],
    "7" => %w[J R L V M B S],
    "8" => %w[D P J],
    "9" => %w[D C N W V]
  }

  instructions.map do |instruction|
    _, amount, from, to = /^\D+(?<amount>\d+)\D+(?<from>\d+)\D+(?<to>\d)$/.match(instruction).to_a
    part_one_stacks[to] << part_one_stacks[from].slice!(-amount.to_i, amount.to_i).reverse
    part_one_stacks[to].flatten!
  end
  message = []
  part_one_stacks.values.each { |value| message << value.pop}
  message.join
end

def part_two(instructions)
  part_two_stacks = {
    "1" => %w[F H B V R Q D P],
    "2" => %w[L D Z Q W V],
    "3" => %w[H L Z Q G R P C],
    "4" => %w[R D H F J V B],
    "5" => %w[Z W L C],
    "6" => %w[J R P N T G V M],
    "7" => %w[J R L V M B S],
    "8" => %w[D P J],
    "9" => %w[D C N W V]
  }

  instructions.map do |instruction|
    _, amount, from, to = /^\D+(?<amount>\d+)\D+(?<from>\d+)\D+(?<to>\d)$/.match(instruction).to_a
    part_two_stacks[to] << part_two_stacks[from].slice!(-amount.to_i, amount.to_i)
    part_two_stacks[to].flatten!
  end
  
  message = []
  part_two_stacks.values.each { |value| message << value.pop}
  message.join
end

puts "part 1: #{part_one(instructions)}"
puts "part 2: #{part_two(instructions)}"