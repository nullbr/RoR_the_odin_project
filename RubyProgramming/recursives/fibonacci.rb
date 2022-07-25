# method #fibs which takes a number and returns an array containing that many numbers from the fibonacci sequence
def fibs(num)
  num < 2 ? num : fibs(num - 1) + fibs(num - 2)
end

arr = []
8.times { |n| arr << fibs(n) }

p arr