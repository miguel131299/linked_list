# frozen_string_literal: true

require_relative 'node'
require_relative 'linked_list'

list = LinkedList.new
list.append(2)
list.append(3)
list.append(4)
list.prepend(1)
list.prepend(0)

puts list.head
puts list.tail

puts list.size

# for i in 0..list.size-1 do
#     puts list.at(i)
# end

# for i in 0..list.size do
#     puts "tail: #{list.tail} "
#     puts list.pop
# end

(-2..10).each do |i|
  puts "#{i}: #{list.contains?(i)}"
end

(-2..10).each do |i|
  puts "#{i}: #{list.find(i)}"
end

# list.insert_at(5, 0)

puts list.head

list.remove_at(7)
puts list.head
