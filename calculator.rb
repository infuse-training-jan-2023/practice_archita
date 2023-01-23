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
end

c = Calculator.new(45.56, -10)
c.add()