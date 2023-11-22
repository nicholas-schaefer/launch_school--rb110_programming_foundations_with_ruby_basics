=begin


Fibonacci Numbers (Procedural)

In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number.
In a language that is not optimized for recursion, some (not all) recursive methods
can be extremely slow and require massive quantities of memory and/or stack space.

Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; as a result,
the Fibonacci solution is only useful up to about fibonacci(40).
With higher values of nth, the recursive solution is impractical.
(Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

Rewrite your recursive fibonacci method so that it computes its results without recursion.

Examples:
=end

def fibonacci(target_fib_key)
  return 1 if target_fib_key <= 2

  past_num = 1
  current_num = 1
  next_num = 0

  (1...target_fib_key).each do |_|
    next_num = current_num + past_num
    past_num = current_num
    current_num = next_num
  end

past_num
end
fibonacci(5)

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(6) == 8
p fibonacci(7) == 13
p fibonacci(8) == 21
p fibonacci(12) == 144
p fibonacci(20) == 6765
