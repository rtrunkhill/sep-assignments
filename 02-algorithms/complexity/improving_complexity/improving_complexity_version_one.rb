def insertion_sort(*arrays)
  sorted_array = []
  arrays.flatten.each do |v|
    l = sorted_array.length
    i = 0
    sorted_array << v if l == 0
    while i < l
      if sorted_array[i] > v
        sorted_array.insert(i, v)
        break
      elsif i == l-1
        sorted_array << v
        break
      end
      i += 1 
    end
  end
  sorted_array
end 

p insertion_sort([1,4,3],[5,3,2],[6,2])

#O(n^2)