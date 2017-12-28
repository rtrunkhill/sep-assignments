require_relative 'node'

class BinaryHeap
  attr_reader :root
  
  def initialize(root)
    @root = root
    @array = [@root]
  end

  def insert(node)
    @array << node unless @array.include?(node)
    p "@array: #{@array}"
    @array = @array.sort_by {|node| node.rating}
    @root = @array[0]
    
    @array.drop(1).each do |node|
        if root.left.nil? 
            root.left = node
            break
        elsif root.right.nil? && root.left != nil
            root.right = node
            break
        # elsif root.left != nil && root.right != nil && root.left.left != nil && root.left.right != nil
        #     insert(root.right, node)
        # elsif root.left != nil && root.right !=nil
        #     insert(root.left, node)
        end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if data.nil? || root.nil?
    return root if root.title == data
    right = find(root.right, data)
    left = find(root.left, data)
    return right if right != nil
    return left if left != nil
    return nil if right.nil? && left.nil?
  end

  def delete(root, data)
    return nil if data.nil?
    dead_node = find(root, data)
    dead_node.nil? ? nil : dead_node.title = nil
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    start = [@root]
    finish = []
    while start.length > 0
      rootx = start.shift
      start << rootx.left if rootx.left != nil
      start << rootx.right if rootx.right != nil
      finish << ("#{rootx.title}: #{rootx.rating}")
    end
    finish.each { |movie| puts movie }
  end
end
