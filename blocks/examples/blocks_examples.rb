puts "\nex 1"
def logger
  yield
end

logger { puts 'hello from the block' }
#=> hello from the block

logger do
  p [1, 2, 3]
end
#=> [1,2,3]

puts "\nex 2"
def double_vision
  yield
  yield
end

double_vision { puts 'How many fingers am I holding up?' }
#=> How many fingers am I holding up?
#=> How many fingers am I holding up?

puts "\nex 3"
def love_language
  yield('Ruby')
  yield('Rails')
end

love_language { |lang| puts "I love #{lang}" }
#=> I love Ruby.
#=> I love Rails.

puts "\nex 4"
@transactions = [10, -15, 25, 30, -24, -70, 999]

def transaction_statement(&block)
  @transactions.each(&block)
end

transaction_statement do |transaction|
  p '%0.2f' % transaction # The bank that calls the method can define how it is handled.
end
#=> ["10.00", "-15.00", "25.00", "30.00", "-24.00", "-70.00", "999.00"]

puts "\nex 5"
@transactions = [10, -15, 25, 30, -24, -70, 999]

def transaction_statement2
  @transactions.each do |transaction|
    p yield transaction # `p` is called within our method now instead of within the block
  end
end

transaction_statement2 do |transaction|
  '%0.2f' % transaction
end
#=> ["10.00", "-15.00", "25.00", "30.00", "-24.00", "-70.00", "999.00"]

puts "\nex6"
def mad_libs
  yield('cool', 'beans', 'burrito') # 3 arguments are passed to yield
end

mad_libs do |adjective, noun, other_noun| # But the block only takes 2 parameters
  puts "I said #{adjective} #{noun} and #{other_noun}!"
end
#=> I said cool beans!

puts "\nex7"
def awesome_method(&block)
  hash = { a: 'apple', b: 'banana', c: 'cookie' }

  hash.each(&block)
end

awesome_method { |key, value| puts "#{key}: #{value}" }
#=> a: apple
#=> b: banana
#=> c: cookie

puts "\nex8 check if block was given"
def maybe_block
  puts 'block party' if block_given?
  puts 'executed regardless'
end

maybe_block
# => executed regardless

maybe_block {} # {} is just an empty block
# => block party
# => executed regardless

puts "\nex9 creating a lambda"
my_name = ->(name) { puts "hello #{name}" }

my_name.call('tim')
my_name.call('tim')
my_name['tim']

puts "\nex10 creating a proc"
a_proc = Proc.new { |name, age| puts "name: #{name} --- age: #{age}" }

a_proc.call("tim", 80)
#=> name: tim --- age: 80
