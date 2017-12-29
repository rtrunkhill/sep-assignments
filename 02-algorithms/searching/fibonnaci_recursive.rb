require 'benchmark'

class Recursive
    def fib(n)
        return 0 if (n == 0)
        return 1 if (n == 1)
        return fib(n-1) + fib(n-2)
    end
end

class Fibonacci
    def fib(n)
        return 0 if n == 0
        return 1 if n == 1
        fib_0 = 0
        fib_1 = 1
        (1..n-1).each do |temp|
            temp = fib_0
            fib_0 = fib_1
            fib_1 = temp + fib_0
        end
        return fib_1
    end
end

recursive = Recursive.new
iterative = Fibonacci.new

puts "recursive:"
puts Benchmark.measure {recursive.fib(20)}

puts "iterative:"
puts Benchmark.measure {iterative.fib(20)}