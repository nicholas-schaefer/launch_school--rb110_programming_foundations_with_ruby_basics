=begin

NEED TO FINISH

Stack Machine Interpretation

A stack is a list of values that grows and shrinks dynamically.
In ruby, a stack is easily implemented as an Array that just uses the #push and #pop methods.

A stack-and-register programming language is a language that uses a stack of values.
Each operation in the language operates on a register, which can be thought of as the current value.
The register is not part of the stack. Operations that require two values pop the topmost item from the stack
(that is, the operation removes the most recently pushed value from the stack),
perform the operation using the popped value and the register value, and then store the result back in the register.

Consider a MULT operation in a stack-and-register language.
It multiplies the stack value with the register value, removes the value from the stack,
and then stores the result back in the register.
Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the stack),
and a register value of 7, then the MULT operation will transform things to 3 6 on the stack (the 4 is removed),
and the result of the multiplication, 28, is left in the register.
If we do another MULT at this point, then the stack is transformed to 3, and the register is left with the value 168.

Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

    n Place a value n in the "register". Do not modify the stack.
    PUSH Push the register value on to the stack. Leave the value in the register.
    ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
    SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
    MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
    DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
    MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
    POP Remove the topmost item from the stack and place in register
    PRINT Print the register value

All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument.
Your program may assume that all programs are correct programs;
that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.

You should initialize the register to 0.
=end

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

def minilang(str_input)
  p arr_commands = str_input.split
  arr_register = []
  arr_commands.each do |command|
    case
    when command == "PUSH"
      # puts "push"
      command_push(arr_register, command)
    when command == "ADD"
      # puts "add"
      command_add(arr_register, command)
    when command == "SUB"
      # puts "sub"
      command_sub(arr_register, command)
    when command == "MULT"
      # puts "mult"
      command_mult(arr_register, command)
    when command == "DIV"
      # puts "div"
      command_div(arr_register, command)
    when command == "MOD"
      # puts "mod"
      command_mod(arr_register, command)
    when command == "POP"
      # puts "pop"
      command_pop(arr_register, command)
    when command == "PRINT"
      # puts "print"
      command_print(arr_register, command)
    when command.to_i.to_s == command
      # puts "integer"
      command_integer(arr_register, command)
    else
    end
  end
end

def command_push(arr_register, str_input)
  arr_register << str_input.to_i
end

def command_add(arr_register, str_input)
  arr_register << str_input.to_i
end

def command_sub(arr_register, str_input)
  arr_register << str_input.to_i
end

def command_mult(arr_register, str_input)
  arr_register << str_input.to_i
end

def command_div(arr_register, str_input)
  arr_register << str_input.to_i
end

def command_mod(arr_register, str_input)
  arr_register << str_input.to_i
end

def command_pop(arr_register, str_input)
  arr_register << str_input.to_i
end

def command_pring(arr_register, str_input)
  arr_register << str_input.to_i
end

def command_integer(arr_register, str_input)
  arr_register << str_input.to_i
end


str_everything = "5 PUSH ADD SUB MULT DIV MOD POP PRINT"
minilang("5")

#minilang('PRINT')
# 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)
