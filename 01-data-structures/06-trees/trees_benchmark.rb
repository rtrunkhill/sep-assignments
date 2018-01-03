require 'benchmark'
require_relative 'binary_heap/binary_heap2'
require_relative 'binary_tree/binary_search_tree'

troot = Node.new("Root Tree", 77)
hroot = Node.new("Heap Root", 77)
tree = BinarySearchTree.new(troot)
heap = BinaryHeap.new(hroot)

n = 10000

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

find_me = Node.new("50k", 5000)
tree.insert(troot, find_me)
heap.insert(find_me)

Benchmark.bm do |x|
  x.report("tree find") do
      tree.find(troot, 5000)
  end
   x.report("heap find") do
     heap.find("50k")
   end
end

Benchmark.bm do |x|
  x.report("tree delete") do
      tree.delete(troot, 5000)
  end
  x.report("heap delete") do
     heap.delete("50k")
  end
end