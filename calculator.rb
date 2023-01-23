class Calculator
    attr_accessor :num1, :num2

    def initialize(x, y)
        @num1 = x
        @num2 = y
    end

    def add()
        sum = num1 + num2
        puts "Sum of #{num1} and #{num2} is #{sum}"
    end

    def subtract()
        diff = num1 - num2
        puts "Difference between #{num1} and #{num2} is #{diff}"
    end

    def multiply()
        prod = num1 * num2
        puts "Product of #{num1} and #{num2} is #{prod}"
    end
end

c = Calculator.new(45.56, -10)
c.add()
c.subtract()
c.multiply()