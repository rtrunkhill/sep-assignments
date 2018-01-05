#heapsort's O(n log n) time complexity is an improvement over Inserstionsorts O(n^2)

def heap_sort(*arrays)
    array = arrays.flatten
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

p heap_sort([1,4,3],[5,3,2],[6,2])