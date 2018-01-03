require 'benchmark'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'quick_sort'

test_array = []

50.times do
    test_array << rand(1..50)
end

# p "test_array: #{test_array}"

Benchmark.bm do |x|
    x.report("heap_sort") { heap_sort(test_array) }
    x.report("quick_sort") { quick_sort(test_array) }
    x.report("bucket_sort") { bucket_sort(test_array) }
end
    