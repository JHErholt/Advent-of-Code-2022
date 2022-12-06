input = File.read("input.txt")

def decode_device(input:, uniq_chars_length:)
  last_chars = []
  used_letters = []
  input_chars = input.chars
  input.chars.length.times do |_|
    last_chars << input_chars.shift
    used_letters << last_chars.shift if last_chars.length > uniq_chars_length
    if last_chars.uniq.length == uniq_chars_length
      return used_letters.length + last_chars.length
    end
  end
end

puts "part 1: #{decode_device(input:, uniq_chars_length: 4)}"
puts "part 2: #{decode_device(input:, uniq_chars_length: 14)}"