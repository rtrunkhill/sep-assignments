require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head == nil
      @head = node
    else
    # @head ||= node
    # @tail ||= node
      @tail.next = node
    end
    @tail = node
  end


  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head != @tail
      current = @head
      while (current.next != @tail) && (current.next != nil)
        current = current.next
      end
      @tail = current
      @tail.next = nil
    else
      @tail = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    current = @head
    puts current.data
    while current.next != nil
      current = current.next
      puts current.data
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current = @head
    if @head == node
      @head = @head.next
    elsif @tail == node
      remove_tail
    else
      while (current.next != nil) && (current.next != node)
        current = current.next
      end
      current.next = current.next.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head.nil?
      @head ||= node
      @tail ||= node
    else
      hold = @head
      @head = node
      @head.next = hold
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head.nil? ? (return nil) : @head = @head.next
  end
end
