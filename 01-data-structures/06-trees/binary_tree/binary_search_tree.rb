require_relative 'node'

class BinarySearchTree
  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating > root.rating
      root.right.nil? ? root.right = node : insert(root.right, node)
    else
      root.left.nil? ? root.left = node : insert(root.left, node)
    end
  end

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
