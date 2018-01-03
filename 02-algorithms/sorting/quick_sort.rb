def quick_sort(array)
  return array if array.length <= 1
  pivot = array.pop
  left = []
  right = []
  array.each do |i|
    i <= pivot ? left << i : right << i
  end
  return quicksort(left) + [pivot] + quicksort(right)
end
# array1 = [2,5,6,3,7,9,1,4]
# array2 = [13,16,8,13,15,3,7]

# puts "#{quicksort(array1)}"
# puts "#{quicksort(array2)}"

