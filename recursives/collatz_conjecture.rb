# The collatz conjecure applies to positive integers and speculated that is is always possible
# to get back to 1 if you follow these stps:
# if n is 1, stop
# if n is even, repeate this poscess on n/2
# if n is odd, repeat this process on 3n + 1

def collatz(num, count = 0)
  if num == 1
    puts count
    nil
  elsif num.even?
    collatz(num / 2, count + 1)
  elsif num.odd?
    collatz(3 * num + 1, count + 1)
  end
end

collatz(3)
collatz(5)
collatz(27)
