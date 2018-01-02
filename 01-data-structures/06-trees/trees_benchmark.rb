require 'benchmark'
require_relative 'binary_heap/binary_heap2'
require_relative 'binary_tree/binary_search_tree'

troot = Node.new("Root Tree", 77)
hroot = Node.new("Heap Root", 77)
tree = BinarySearchTree.new(troot)
heap = BinaryHeap.new(hroot)

n = 100000

Benchmark.bm do |x|
    x.report("tree insert") do
        for i in 1..n do
            new_node = Node.new("tree", Random.rand(100000))
            tree.insert(troot, new_node)
        end
    end
  x.report("heap insert") do
     for i in 1..n do
      new_node = Node.new("heap", Random.rand(100000))
      heap.insert(new_node)
     end
  end
end

# Benchmark.bm(7) do |x|
#   x.report("for:")   { 
#       for i in 1..n 
#         a = "1" 
#       end 
#   }
  
# end