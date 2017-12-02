class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    hash = @items[index(key, @size)]
    if hash.nil?
      @items[index(key, @size)] = HashItem.new(key, value)
    elsif hash.key != key
      while @items[index(key, @size)].key != nil && @items[index(key, @size)].key != key
        resize
        new_index = index(key, @size)
        break if @items[new_index] == nil
      end
      self[key] = value
    elsif hash.key == key && hash.value != value
      resize
      hash.value = value
    end
  end
 

  def [](key)
    item = @items[index(key, @size)]
    item.nil? ? nil : item.value
  end

  def resize
    temp = @items.compact
    @size = @size * 2
    @items = Array.new(@size)
    temp.each { |i| @items[index(i.key, @size)] = i }
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

end