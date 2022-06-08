class Calculator
  def add(a, b, c = 0)
    a + b + c
  end

  def subtract(a, b, c = 0)
    a - b - c
  end

  def multiply(a, b, c = 1)
    a * b * c
  end

  def divide(a, b, c = 1)
    a / b / c unless b.zero? || c.zero?
  end

  def divisible?
    
  end
end
