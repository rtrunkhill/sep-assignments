require_relative 'node'

class BinarySearchTree
  
  # Provided Psuedo code from CP
  # DEF FIND_THE_OLDEST(root)
  #   SET temp to root
  #   WHILE temp.right exists
  #     ASSIGN temp.right to temp
  #   END WHILE
  #   RETURN temp
  # END DEF

# The single rule we follow is that each child points to an older child with their right arm, 
# and a younger one with their left.

  def initialize(root)
    # root = Node.new(title, rating)
    @root = root
  end

  def insert(root, node)
    # node = Node.new(title,rating)
    # p "node.title: #{node.title}"
    # p "root.title: #{root.title}"
    # p "********************************"
    if node.rating > root.rating
      root.right.nil? ? root.right = node : insert(root.right, node)
    else
      root.left.nil? ? root.left = node : insert(root.left, node)
    end
    # if root.right == nil && root.left == nil
    #   node.rating >= root.rating ? @root.right = node : @root.left  = node
    # elsif root.right == nil && root.left != nil
    #   root.right = node
    # elsif root.right != nil && root.left == nil
    #   root.left = node
    # else
    #   root.left = root
    #   insert(root, node)
    # end
    # node.rating >= root.rating ? @root.right = node : @root.left  = node
    # p "root.right: #{root.right.title}"
    # p "root.left: #{root.left.title}"
    # root = node
  end

  # Recursive Depth First Search
  def find(root, data)
    # p "find(root.left.title,data) #{root.left.title} = #{data}"
    return nil if data.nil?
    
    if root.title == data
      return root
    elsif root.left != nil
      find(root.left, data)
      # find(root.left, data) if root.left != nil
    elsif root.right != nil
      find(root.right, data)
    end
  end

  def delete(root, data)
    return nil if data.nil?
    
    dead_node = find(root, data)
    dead_node.nil? ? nil : dead_node.title = nil
    # if root.title == data
    #   root = nil
    # elsif root.left != nil
    #   delete(root.left, data)
    # elsif root.right != nil
    #   delete(root.right, data)
    # end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    start = [@root]
    # p "start: #{start}"
    finish = []
    while start.length > 0
      rootx = start.shift
      start << rootx.left if rootx.left != nil
      start << rootx.right if rootx.right != nil
      finish << ("#{rootx.title}: #{rootx.rating}")
    end
    # p "finish: #{finish}"
    finish.each { |movie| puts movie }
  end
  
  # def printf(children=nil)
  #   start = [@root]
  #   p "start: #{start}"
  #   finish = []
  #   start.each do |movie|
  #     puts "#{movie.title}: #{movie.rating}"
  #     finish << movie.left if movie.left != nil
  #     finish << movie.right if movie.right != nil
  #   end
  #   p "*************************"
  #   # p "#{finish[2].title}: #{finish[2].rating}"
  #   p "finsih: #{finish}"
  #   finish.each { |movie| puts "#{movie.title}: #{movie.rating}" }
  #   # finish.size == 0 ? (return nil) : (printf(finish))
  #   # if finish.size == 0
  #   #   return nil
  #   # else
  #   #   printf(finish)
  #   #   finish.each { |movie| puts "#{movie.title}: #{movie.rating}" }
  # end
end
