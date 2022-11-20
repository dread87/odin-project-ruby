class Node
  attr_accessor :next, :data

  def initialize(data = nil)
    @next = nil
    @data = data
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
    @tail = nil
  end

  def create_node(data)
    Node.new(data)
  end

  def append(value)
    node = create_node(value)
    if @head.nil?
      @head = node
    else
      @tail.next = node
    end
    @tail = node
  end

  def prepend(value)
    node = create_node(value)

    if @head.nil?
      @head = node
      @tail = node
    else
      node.next = @head
      @head = node
    end
  end

  def pop
    return nil if @head.nil?

    node = @head
    @head = @head.next
    node
  end

  def size
    total = 0
    head = @head
    until head.nil?
      total += 1
      head = head.next
    end
    total
  end

  def at(index)
    if index > size || size.zero?
      nil
    else
      node = @head
      (1..index).each { node = node.next }
      node
    end
  end

  def find(value)
    node = @head
    index = 0
    until node.nil?
      return index if node.data == value

      node = node.next
      index += 1
    end
    nil
  end

  def contains?(value)
    find(value) != nil
  end

  def to_s
    return '( nil ) -> nil' if @head.nil?

    node = @head
    str = ''
    while node.next
      str << "( #{node.data} ) -> "
      node = node.next
    end
    str << 'nil'
  end
end
