def recursive_search(col, value)
    return "#{value}? We don't know of any #{value}" if col.length == 0
    first = 0
    last = col.length - 1
    mid = col.length / 2
    return "WOOT! #{value} has been found!" if value == col[mid]
    col[mid] < value ? (return recursive_search(col[mid+1..last], value)) : (return recursive_search(col[first..mid-1], value))
end

array1 = [0,2,4,6,8,10,12,14,16,18,20]
array2 = [1,3,5,7,9,11,13,15,17,19,21]

puts recursive_search(array1, 6)
puts recursive_search(array1, 7)
puts recursive_search(array2, 17)
puts recursive_search(array2, 10)