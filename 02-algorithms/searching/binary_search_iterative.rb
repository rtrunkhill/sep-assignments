# DEF BINARY_SEARCH(collection, value)
#  low = 0
#  high = length_of(collection) - 1

#  WHILE low <= high
#   mid = (low + high) / 2
#   IF collection[mid] > value THEN
#      high = mid - 1
#   ELSE IF collection[mid] < value
#      low = mid + 1
#   ELSE
#      return mid
#   END IF
#  END WHILE
#  return not_found

def iterative_search(col, value)
    return "value not in collection" unless col.include?(value)
    first = 0
    last = col.length - 1
    while first <= last
        mid = (first + last) / 2
        last = mid - 1 if col[mid] > value
        first = mid + 1 if col[mid] < value
        return "#{value} is at index #{mid}" if col[mid] == value
    end
end

array1 = [0,2,4,6,8,10,12,14,16,18,20]
array2 = [1,3,5,7,9,11,13,15,17,19,21]

puts iterative_search(array1, 6)
puts iterative_search(array1, 7)
puts iterative_search(array2, 17)
puts iterative_search(array2, 10)