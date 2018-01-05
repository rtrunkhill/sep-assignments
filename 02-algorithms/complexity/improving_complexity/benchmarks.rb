require 'benchmark'
require_relative 'improving_complexity_version_one'
require_relative 'improving_complexity_version_two'

array1 = (1..250).to_a.shuffle!
array2 = (1..250).to_a.shuffle!
array3 = (1..250).to_a.shuffle!

array4 = (1..1000).to_a.shuffle!
array5 = (1..1000).to_a.shuffle!
array6 = (1..1000).to_a.shuffle!

array7 = (1..10000).to_a.shuffle!
array8 = (1..10000).to_a.shuffle!
array9 = (1..10000).to_a.shuffle!


Benchmark.bm do |x|
  x.report('one 250:') {insertion_sort(array1, array2, array3)}
  x.report('one 1k:') {insertion_sort(array4, array5, array6)}
  x.report('one 10K:') {insertion_sort(array7, array8, array9)}
  p "-----------------------------------------------------"
  x.report('two 250:') {heap_sort(array1, array2, array3)}
  x.report('two 1k:') {heap_sort(array4, array5, array6)}
  x.report('two 10K:') {heap_sort(array7, array8, array9)}
end