require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

array = []
llist = LinkedList.new

#  * Compare the time it takes to create a 10,000 item Array to appending 10,000 items to a Linked List.

p "Array to 10k"
puts Benchmark.measure {
    (0..9999).each do |i|
        array[i] = Node.new(i)
    end
}

p "10k Node LList"
puts Benchmark.measure {
    (0..10000).each do |i|
        llist.add_to_tail(Node.new(i))
    end
}

#  * Compare the time it takes to access the 5000th element of the Array and the 5000th Node in the Linked List.

p "Array to 5k object"
puts Benchmark.measure {
    array[4999]
}

p "LList to 5k node"
puts Benchmark.measure {
    node = llist.head
    (1..5000).each do |i|
        node = node.next
    end
}

#  * Compare the time it takes to remove the 5000th element from the Array to removing the 5000th Node in the Linked List.
p "Array delete 5k object"
puts Benchmark.measure {
    array.delete_at(4999)
}

p "LList delete 5k node"
puts Benchmark.measure {
    node = llist.head
    (1..5000).each do |i|
        node = node.next
    end
    llist.delete(node)
}

