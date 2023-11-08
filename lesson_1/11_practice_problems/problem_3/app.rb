ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.reject! do |_, value|
  value > 100
end

p ages



=begin
remove people with age 100 and greater.

input - hash
output -original hash, modified
=end
