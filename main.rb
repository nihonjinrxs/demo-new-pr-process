#!/usr/bin/env ruby
require './lib/greeter'

g = Greeter.new
puts g.greet

puts g.greet_by_name 'Alice'
puts g.greet_by_name 'Ben'
