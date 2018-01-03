def heap_sort(array)
  return array if array.length <= 1
  heapify(array)
  back = (array.length - 1)
  while back > 0
    array[back], array[0] = array[0], array[back]
    back -= 1
    sift_down(array, 0, back)
  end
  return array
end

def heapify(array)
    front = (array.length - 2) / 2
    while front >= 0
        sift_down(array, front, array.length - 1)
        front -= 1
    end
    array
end

def sift_down(array, front, back)
  root = front
  while root * 2 + 1 <= back
    child = root * 2 + 1
    swap = root
    swap = child if array[swap] < array[child]
    swap = child + 1 if child + 1 <= back && array[swap] < array[child + 1]
    if swap != root
      array[root], array[swap] = array[swap], array[root]
      root = swap
    else
      return
    end
  end
end
  
# array1 = [0,19,14,22,32,7,9,63,4,13]
# array2 = [0,1,2,3,4,5,6,7,8,9]
# array3 = [0,16,29,43,61,39,4,9,93,3,11,10,113]

# puts "#{heapsort(array1)}"
# puts "#{heapsort(array2)}"
# puts "#{heapsort(array3)}"





