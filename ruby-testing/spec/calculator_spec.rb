require './lib/calculator'

# spec/calculator_spec.rb

describe Calculator do
  describe '#add' do
    it 'returns the sum of two numbers' do
      expect(subject.add(5, 2)).to eql(7) # using subject istead of declaring a variable
    end

    it 'returns the sum of more than two numbers' do
      calculator = Calculator.new
      expect(calculator.add(5, 2, 6)).to eql(13)
    end
  end

  describe '#subtract' do
    it 'returns the subtraction of two numbers' do
      calculator = Calculator.new
      expect(calculator.subtract(5, 2)).to eql(3)
    end

    it 'returns the subtraction of more than two numbers' do
      calculator = Calculator.new
      expect(calculator.subtract(15, 2, 5)).to eql(8)
    end
  end

  describe '#multiply' do
    it 'returns the multiplication of two numbers' do
      calculator = Calculator.new
      expect(calculator.multiply(5, 6)).to eql(30)
    end

    it 'returns the multiplication of more than two numbers' do
      calculator = Calculator.new
      expect(calculator.multiply(5, 6, 10)).to eql(300)
    end
  end

  describe '#divide' do
    it 'returns the division of two numbers' do
      calculator = Calculator.new
      expect(calculator.divide(10, 2)).to eql(5)
    end

    it 'returns the division of more than two numbers' do
      calculator = Calculator.new
      expect(calculator.divide(10, 2, 1)).to eql(5)
    end

    it 'returns nil if division by 0' do
      calculator = Calculator.new
      expect(calculator.divide(10, 0)).to eql(nil)
    end

    it 'returns nil if division by 0 with a third number' do
      calculator = Calculator.new
      expect(calculator.divide(10, 1, 0)).to eql(nil)
    end
  end
end
