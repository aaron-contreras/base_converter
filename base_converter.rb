def to_binary(decimal)
  decimal = decimal.to_i
  digits = []

  until decimal == 0
    digits.push(decimal % 2)
    decimal /= 2
  end

  digits.reverse.join
end

def to_decimal(binary)
  binary = binary.to_s.split('').map {|digit| digit.to_i}

  converted_digits = binary.map.with_index do |digit, index|
    if digit == 1
      digit * 2**(binary.length - 1 - index)
    else
      digit
    end
  end

  converted_digits.reduce {|sum, number| sum + number}
end

puts "Numerical base converter".center(80)
puts "--------------".center(80)
puts "Which bases would you like to convert to and from?"
puts "(1) Decimal to binary"
puts "(2) Binary to decimal"

modes = {
  1 => [:dec_to_bin, "Decimal", "Binary"],
  2 => [:bin_to_dec, "Binary", "Decimal"]
}

selected_mode = gets.chomp.to_i

puts "Please enter the number you'd like to convert"

number = gets.chomp

if modes[selected_mode].first == :bin_to_dec
  answer = to_decimal number
else
  answer = to_binary number
end
print "Here you go => "
puts "#{number} in #{modes[selected_mode].last} is #{answer}."