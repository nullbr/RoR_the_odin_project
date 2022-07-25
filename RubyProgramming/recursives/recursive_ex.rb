# counting with loop
def count(n)
  while n > 0
    puts n
    n -= 1
  end
end

# counting with recursive
def count_recursive(n)
  return if n <= 0

  puts n
  countRecursive(n - 1)
end

# range sum with loop
def range_sum(n)
  total = n
  n.times do |i|
    total += i
  end
  puts total
end

# range sum with recursive
def range_sum_recursive(n, total = 0)
  if n <= 0
    puts total
    return
  end

  range_sum_recursive(n - 1, total + n)
end

# best user for recursives
def get_info_down_tree(tree)
  return if tree[:children].empty?

  tree[:children].each do |child|
    puts child
    get_info_down_tree(child)
  end
end

# count(4)
# countRecursive(4)

# range_sum(6)
# range_sum_recursive(6)

tree = {
  name: 'John',
  children: [
    {
      name: 'Jim',
      children: []
    },
    {
      name: 'Zoe',
      children: [
        { name: 'kyle', children: [] },
        {
          name: 'Sophia',
          children: [
            { name: 'Bruno', children: [] }
          ]
        }
      ]
    }
  ]
}

get_info_down_tree(tree)
