require_relative 'node'

class BinaryHeap
  attr_reader :root
  attr_reader :items
  
  def initialize(root)
    @root = root
    @items = [@root]
  end

  def insert(node)
    @items << node unless @items.include?(node)
    @items = @items.sort_by {|node| node.rating}
    @root = @items[0]
  end

  # Recursive Depth First Search
  def find(data)
    @items.each do |item|
      return item if item.title == data
    end
    return nil
  end

  def delete(data)
    data.nil? ? (return nil) : dead_node = find(data)
    dead_node.nil? ? nil : @items.delete(dead_node)
    @items = @items.sort_by {|node| node.rating}
  end

  # Recursive Breadth First Search
  def printf
    @items.each { |movie| puts "#{movie.title}: #{movie.rating}" }
  end
end
