require_relative 'node.rb'
require_relative 'linked_list.rb'

list = LinkedList.new
list.append(1)
list.append(2)
list.append(3)
list.prepend(0)
list.prepend(-1)

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

for i in -2..10 do
    puts "#{i}: #{list.contains?(i)}"
end

for i in -2..10 do
    puts "#{i}: #{list.find(i)}"
end