# https://www.codequizzes.com/computer-science/beginner/recursion

# Define a recursive function that finds the factorial of a number.
def factorial(num)
  if num == 0
    1
  else
    n * factorial(num - 1)
  end
end

# Define a recursive function that returns true if a string is a palindrome and false otherwise.
def palindrome(str)
  if str.length.zero? || str.length == 1
    true
  elsif str[0] == str[-1]
    palindrome(str[1..-2])
  else
    false
  end
end

# Define a recursive function that takes an argument n and prints "n bottles of beer on the wall",
# "(n-1) bottles of beer on the wall", ..., "no more bottles of beer on the wall".
def beers_on_the_wall(num)
  if num.zero?
    puts 'No more bottles of beer on the wall'
  else
    puts "#{num} bottles of beer on the wall"
    beers_on_the_wall(num - 1)
  end
end

# Define a recursive function that takes an argument n and returns the fibonacci value of that position.
# The fibonacci sequence is 0, 1, 1, 2, 3, 5, 8, 13...
# So fib(5) should return 5 and fib(6) should return 8.
def fibonacci_position(pos)
  if pos.zero? || pos == 1
    pos
  else
    fibonacci_position(pos - 1) + fibonacci_position(pos - 2)
  end
end

# Define a recursive function that flattens an array.
# The method should convert [[1, 2], [3, 4]] to [1, 2, 3, 4] and [[1, [8, 9]], [3, 4]] to [1, 8, 9, 3, 4].
def flatten(array, result = [])
  array.each do |element|
    if element.is_a?(Array)
      flatten(element, result)
    else
      result << element
    end
  end
  result
end

# Use the roman_mapping hash to define a recursive method that converts an integer to a Roman numeral.
def integer_to_roman(roman_mapping, number, result = "")
  return result if number.zero?
  
  roman_mapping.keys.each do |divisor|
    quotient, modulus = number.divmod(divisor)
    result << roman_mapping[divisor] * quotient
    return integer_to_roman(roman_mapping, modulus, result) if quotient > 0
  end
end

# puts factorial(3)
# puts palindrome('brunonurb')
# puts palindrome('bruno')

# beers_on_the_wall(6)

# puts fibonacci_position(6)

# nested_arr = [[1, 2], [3, 4]]
# p flatten(nested_arr)

roman_mapping = {
  1000 => 'M',
  900 => 'CM',
  500 => 'D',
  400 => 'CD',
  100 => 'C',
  90 => 'XC',
  50 => 'L',
  40 => 'XL',
  10 => 'X',
  9 => 'IX',
  5 => 'V',
  4 => 'IV',
  1 => 'I'
}

puts integer_to_roman(roman_mapping, 120)
