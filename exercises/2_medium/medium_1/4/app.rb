=begin

1000 Lights

You have a bank of switches before you, numbered from 1 to n.
Each switch is connected to exactly one light that is initially off.
You walk down the row of switches and toggle every one of them.
You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on.
On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on.
You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches,
and returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

    round 1: every light is turned on
    round 2: lights 2 and 4 are now off; 1, 3, 5 are on
    round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
    round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
    round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].


input = integer (number of light switches)
output = array (of integers, indicating which lights are on)

data structure = hash ( count at the end if even or odd)

Algorithm
Create hash "Light on", initials keys are switches  numbered 1 - count_switches. Initial values are all false




=end
require "pry"

def which_switches_on?(count_switches)
  hash_switch_on =  (1..count_switches).to_h {|item| [item, false] }
  toggle_counter = 1

  while toggle_counter <= count_switches
    toggle_counter.step(by: toggle_counter, to: count_switches) do |i|
      hash_switch_on[i] = !(hash_switch_on[i])
    end
    toggle_counter += 1
  end
  hash_switch_on.select{|_key, value| value}.keys
end

p which_switches_on?(5) ==[1,4]
p which_switches_on?(2) ==[1]
p which_switches_on?(3) ==[1]
