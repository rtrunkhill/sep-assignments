require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    thing = index(key, @size)
    hash = @items[thing]
    if hash.nil?
      @items[index(key, @size)] = Node.new(key, value)
    elsif hash.key != key
      while @items[index(key, @size)].key != nil && @items[index(key, @size)].key != key
        resize
        new_index = index(key, @size)
        break if @items[new_index] == nil
      end
      self[key] = value
    elsif hash.key == key && hash.value != value
      if next_open_index(thing) == -1
        resize
        new_index = index(key, @size)
        @items[new_index].value = value
      else
        a_index = next_open_index(index(key, @size))
        @items[a_index] = value
      end
    end
  end

  def [](key)
    item = @items[index(key, @size)]
    item.nil? ? nil : item.value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    first_index = index
    while index <= (@size -1)
      if @items[index] == nil
        return index
      elsif @items[index] != nil && index == (first_index - 1)
        return -1
      elsif @items[index] != nil && @items[index] == (@size -1)
        index = 0
      else
        index += 1
      end
    end
    -1
    
    # if @items.any?{ |i| i.nil? } === true
    #   @items.each do |i|
    #     if i == nil
    #       i = @items[index]
    #       break
    #     end
    #   end
    # else
    #   return -1
    # end
  end


  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    temp = @items.compact
    @size = @size * 2
    @items = Array.new(@size)
    temp.each { |i| @items[index(i.key, @size)] = i }
  end
end