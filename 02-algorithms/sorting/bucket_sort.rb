def quicksort(array)
    return array if array.length <= 1
    pivot = array.pop
    left = []
    right = []
    array.each do |i|
        i <= pivot ? left << i : right << i
    end
    return quicksort(left) + [pivot] + quicksort(right)
end

def bucket_sort(array)
  return array if array.length <= 1
  max_value = (array.max)/3.floor
  first = []
  second = []
  third = []
  array.each do |x|
    first << x if x <= max_value
    second << x if x > max_value && x <= max_value * 2
    third << x if x > max_value * 2
  end
  return quicksort(first) + quicksort(second) + quicksort(third)
end

# array1 = [2,5,6,3,7,9,1,4]
# array2 = [13,16,8,13,15,3,7,32,45,68]

# puts "sorted array1: #{bucketsort(array1)}"
# puts "sorted array2: #{bucketsort(array2)}"