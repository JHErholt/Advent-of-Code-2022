CONVERT = { "A" => "rock", "B"  => "paper", "C" => "scissors", "X" => "X", "Y" => "Y", "Z" => "Z" }
CONVERT_PLAYER_HAND = { "X" => "rock", "Y" => "paper", "Z" => "scissors"}

input = File.read("input.txt")
rounds = input.split("\n").map { |round| round.to_s.split(/\s/).map { |strategy| CONVERT[strategy] } }

def win?(elf_hand:, player_hand:)
  case elf_hand
  when "rock"
    return true if player_hand == "paper"
  when "paper"
    return true if player_hand == "scissors"
  when "scissors"
    return true if player_hand == "rock"
  else
    return false
  end
end

def draw?(elf_hand:, player_hand:)
  elf_hand == player_hand
end

def make_player_hand_part_two(elf_hand:, player_hand:)
  case player_hand
  when "Z"
    return "rock" if win?(elf_hand:, player_hand: "rock")
    return "paper" if win?(elf_hand:, player_hand: "paper")
    return "scissors" if win?(elf_hand:, player_hand: "scissors")
  when "Y"
    return "rock" if draw?(elf_hand:, player_hand: "rock")
    return "paper" if draw?(elf_hand:, player_hand: "paper")
    return "scissors" if draw?(elf_hand:, player_hand: "scissors")
  when "X"
    return "rock" unless win?(elf_hand:, player_hand: "rock") || draw?(elf_hand:, player_hand: "rock")
    return "paper" unless win?(elf_hand:, player_hand: "paper") || draw?(elf_hand:, player_hand: "paper")
    return "scissors" unless win?(elf_hand:, player_hand: "scissors") || draw?(elf_hand:, player_hand: "scissors")
  end
end

def calculate_score(rounds)
  sum = 0
  rounds.each do |round|
    case round[1]
    when "rock"
      sum += 1
    when "paper"
      sum += 2
    when "scissors"
      sum += 3
    end

    if win?(elf_hand: round[0], player_hand: round[1])
      sum += 6
      next
    elsif draw?(elf_hand: round[0], player_hand: round[1])
      sum += 3
    end
  end
  return sum
end

def part_one(rounds)
  return calculate_score(rounds.map { |round| [round[0], CONVERT_PLAYER_HAND[round[1]]] })
end

def part_two(rounds)
  return calculate_score(rounds.map { |round| [round[0], make_player_hand_part_two(elf_hand:round[0],player_hand:round[1])] })
end

puts "part 1: #{part_one(rounds)}"
puts "part 2: #{part_two(rounds)}"