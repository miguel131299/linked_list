# frozen_string_literal: true

class LinkedList
  attr_reader :head, :tail, :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # adds new node with value to the end of the list
  def append(value)
    new_node = Node.new(value)

    # list is empty
    if @head.nil?
      @head = new_node
    # list not empty
    else
      @tail.next_node = new_node
    end

    @tail = new_node

  end

  def prepend(value)
    new_node = Node.new(value)

    # list is empty
    if @head.nil?
      @head = new_node
      @tail = new_node

    # list not empty
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    return 0 if @head.nil?

    result = 1
    current_node = @head
    # while next_node exists
    until current_node.next_node.nil?
      current_node = current_node.next_node
      result += 1
    end

    result
  end

  def at(index)
    return 'IndexOutOfBounds' if index.negative?

    counter = 0
    current_node = @head

    while counter < index

      return 'IndexOutOfBounds' if current_node == @tail

      current_node = current_node.next_node
      counter += 1
    end

    current_node
  end

  def pop
    case @head
    when nil
      return 'List is Empty!'
    when @tail
      'here'
      to_be_popped = @head

      @head = nil
      @tail = nil

      return to_be_popped
    end

    current_node = @head

    current_node = current_node.next_node while current_node.next_node != @tail

    to_be_popped = @tail
    @tail = current_node
    current_node.next_node = nil

    to_be_popped
  end

  def contains?(value)
    return false if @head.nil?

    current_node = @head

    until current_node.nil?
      return true if value == current_node.value

      current_node = current_node.next_node
    end

    false
  end

  def find(value)
    return nil if @head.nil?

    current_node = @head
    counter = 0

    until current_node.nil?
      return counter if value == current_node.value

      current_node = current_node.next_node
      counter += 1
    end

    nil
  end

  def insert_at(value, index)

    if index == 0
      prepend(value)
      return
    end

    new_node = Node.new(value)

    previous = at(index - 1)
    new_node.next_node = previous.next_node
    previous.next_node = new_node
  end

  def remove_at(index)

    if index < 0 || index >= size
      return "IndexOutOfBounds"
    end

    if @head == @tail
      @head = nil
      @tail = nil
      return
    end
    
    if index == 0
      @head = @head.next_node
      return
    end

    previous = at(index-1)

    if previous.next_node == @tail
      @tail = previous
      previous.next_node = nil
      return
    end

    previous.next_node = previous.next_node.next_node
  end
end
