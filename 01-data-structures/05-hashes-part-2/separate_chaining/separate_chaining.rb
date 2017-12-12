require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @size = size
    @counter = 0
  end
  
# need to adjust for Linked lists
# trash current node assigments?
# if hash is nil, create a linked list (hash.head?)
# if hash != nil, make the hash the head (add_to_front())
# compare vs. load factor, if load_factor > max_load_factor then resize
# do I need to refactor resize function?

# provided pseudocode:
# DEF INSERT(key, value)
#     COMPUTE the hash code for key, ASSIGN to index
#     GET array[index], ASSIGN to oldHead
#     SET array[index] to a link that contains key and value
#     IF oldHead exists THEN
#         SET oldHead as the second link in the chain
#     END IF
# END DEF


  def []=(key, value)
    hash = Node.new(key,value)
    i  = index(key, @size)
    
    @items[i] != nil ? llist = @items[i] : llist = LinkedList.new
    
    llist.add_to_tail(hash)
    @items[i] = llist
    @counter += 1
    # if @items[i].nil? 
    #   @items[i] = LinkedList.new 
    #   @items[i].add_to_front(hash)
    #   @counter += 1
    #   # p "*************"
    #   # p "items at index[1]: #{@items[i]}"
    # elsif @items[i] != nil
    #   @items[i].add_to_tail(hash)
    #   @counter += 1
    # end
    # p "@items[i]: #{@items[i]}"
    # # p "hash.sum % @size: #{hash.sum % @size}"
    # p "hash.value: #{hash.value}"
    # p "@items.size: #{@items.size}"
    #stops at number five
    #if i add these two puts statements it stops at one
    # p "head.value: #{head.value}"
    # p "tail.value: #{tail.value}"
    if load_factor > @max_load_factor
      resize
    end
  
    # thing = index(key, @size)
    # hash = @items[thing]
    # if hash.nil?
    #   @items[index(key, @size)] = Node.new(key, value)
    # elsif hash.key != key
    #   while @items[index(key, @size)].key != nil && @items[index(key, @size)].key != key
    #     resize
    #     new_index = index(key, @size)
    #     break if @items[new_index] == nil
    #   end
    #   self[key] = value
    # elsif hash.key == key && hash.value != value
    #   if next_open_index(thing) == -1
    #     resize
    #     new_index = index(key, @size)
    #     @items[new_index].value = value
    #   else
    #     a_index = next_open_index(index(key, @size))
    #     @items[a_index] = value
    #   end
    # end
  end

  def [](key)
    llist = @items.at(index(key, @items.size))
    if llist != nil
      x = llist.head
      while x != nil
        if x.key == key
          return x.value
        end
        x = x.next 
      end
    end
    # p "[](key): #{llist}"
    # xhead = llist.head
    # llist.nil? && xhead.key == key ? nil : xhead.value
    # item = @items[index(key, @size)]
    # item.nil? ? nil : item.value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % @size
  end

  # Calculate the current load factor
  def load_factor
   @counter.to_f / @size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    @size = @size * 2
    temp = Array.new(@size)
    
    (0..@items.size-1).each do |i|
      list = @items[i]
      if list != nil
          current  = list.head
          newIndex = index(current.key, temp.size)
          while current != nil
            list = LinkedList.new
            list.add_to_front(current)
            temp[newIndex] = list
            current = current.next
          end
      end
     end 
    @items = temp
  end
end
    # @items[i] != nil ? llist = @items[i] : llist = LinkedList.new
    
    # llist.add_to_tail(hash)
    # @items[i] = llist
# def resize
#     temp = @items.compact
#     @size = @size * 2
#     puts "updated size: #{@size} "
#     @items =
#     puts "updated items.size: #{@items.size}"

  # temp.each do |llist|
    #   while llist.size > 0
    #     current  = llist.remove_front
    #     p "current: #{current}"
    #     # newIndex = index(current,@size)
    #     # p "newIndex: #{newIndex}"
    #     self[current.key]= current.value
    #     # @items[newIndex].add_to_front(current)
    #   end
    # end
    
#     @items = temp
