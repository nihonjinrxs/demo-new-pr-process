#!/usr/bin/env ruby
require './lib/greeter'

g = Greeter.new
puts g.greet

puts g.greet_by_name 'Alice'
puts g.greet_by_name 'Ben'

puts "Supported styles:"
Greeter.greeting_styles.each do |k, v|
  puts " -> #{k.inspect}"
end
puts g.greet_as 'Alice', as: :pirate
puts g.greet_as 'Alice', as: :victorian
puts g.greet_as 'Alice', as: :aussie
