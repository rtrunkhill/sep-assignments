require_relative 'node'

class BinaryHeap
  attr_reader :root
  
  def initialize(root)
    @root = root
  end

  def insert(root, node)
    # p "root.title before/after swap: #{root.title}"
    # p "node.title before/after swap: #{node.title}"
    # p "*****************************"
    if node.rating < root.rating
      hold = root
      @root = node
      node = hold
      insert(@root, node)
    else
      if root.left.nil?
        root.left = node
        # p "root.left.title: #{root.left.title}"
      elsif root.right.nil? && root.left != nil
        root.right = node
      elsif root.left != nil && root.right != nil && root.left.left != nil && root.left.right != nil
        insert(root.right, node)
      elsif root.left != nil && root.right !=nil
        insert(root.left, node)
      end
    end 
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if data.nil?
    if root.title == data
      return root
    elsif root.left != nil
      find(root.left, data)
    elsif root.right != nil
      find(root.right, data)
    end
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
