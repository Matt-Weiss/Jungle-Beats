class LinkedList
  attr_reader :head, :count

  def initialize
    @head = nil
    @count = 0
  end

  def find_tail
    current_node = @head
    while current_node.next_node
      current_node = current_node.next_node
    end
    current_node
  end

  def advance_list(index)
    current_node = @head
    (index).times do
      current_node = current_node.next_node
    end
    current_node
  end

  def append(data)
    @count += 1
    new_node = Node.new(data)
    if @head
      find_tail.next_node = new_node
    else
      @head = new_node
    end
    new_node.data
  end

  def prepend(data)
    @count += 1
    new_head = Node.new(data)
    new_head.next_node = @head
    @head = new_head
    @head.data
  end

  def insert(index, data)
    @count += 1
    new_node = Node.new(data)
    new_node.next_node = advance_list(index)
    advance_list(index - 1).next_node = new_node
    new_node.data
  end

  def to_string
    string = ""
    current_node = @head
    while current_node
      string += " #{current_node.data}"
      current_node = current_node.next_node
    end
    string.lstrip!
  end

  def find(index, number_to_retrieve)
    string = ""
    current_node = advance_list(index)
    number_to_retrieve.times do
      string += " #{current_node.data}"
      current_node = current_node.next_node
    end
  string.lstrip!
  end

  def includes?(query)
    current_node = @head
    while current_node
      if current_node.data == query
        return true
      else
        current_node = current_node.next_node
      end
    end
    false
  end

  def pop
    @count -= 1
    last_node = advance_list(@count)
    next_to_last_node = advance_list(@count - 1)
    next_to_last_node.next_node = nil
    last_node.data
  end
end
