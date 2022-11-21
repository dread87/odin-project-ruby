class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def <=>(other)
    @data <=> other.data
  end
end

class BBST
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array.uniq.sort)
  end

  def build_tree(array)
    return nil if array.empty?
    return Node.new(array.first) if array.length == 1

    mid = array.length / 2
    root = Node.new(array[mid])
    root.left = build_tree(array[..mid - 1])
    root.right = build_tree(array[mid + 1..])

    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(data, root = @root)
    return Node.new(data) if root.nil?

    if root.data == data
      root
    elsif root.data < data
      root.right = insert(data, root.right)
    else
      root.left = insert(data, root.left)
    end

    root
  end

  def minValueNode(node)
    return node if node.left.nil?

    minValueNode(node.left)
  end

  def delete(data, root = @root)
    return root if root.nil?

    if data < root.data
      root.left = delete(data, root.left)
    elsif data > root.data
      root.right = delete(data, root.right)
    elsif root.left.nil?
      temp = root.right
      root = nil
      return temp
    elsif root.right.nil?
      temp = root.left
      root = nil
      return temp
    else
      temp = minValueNode(root.right)
      root.data = temp.data
      root.right = delete(temp.data, root.right)
    end
    root
  end

  def find(data, root = @root)
    return root if root.nil? || root.data == data

    root.data < data ? find(data, root.right) : find(data, root.left)
  end

  def level_order(root = @root)
    return nil if root.nil?

    queue = []
    result = []
    queue.push(root)
    until queue.empty?
      node = queue.shift
      result.push(block_given? ? yield(node) : node)
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end
    result
  end

  def inorder(root = @root, output = [], &)
    return unless root

    inorder(root.left, output, &)
    block_given? ? yield(root) : output.push(root)
    inorder(root.right, output, &)

    output
  end

  def preorder(root = @root, output = [], &)
    return unless root

    block_given? ? yield(root) : output.push(root)
    preorder(root.left, output, &)
    preorder(root.right, output, &)

    output
  end

  def postorder(root = @root, output = [], &)
    return unless root

    postorder(root.left, output, &)
    postorder(root.right, output, &)
    block_given? ? yield(root) : output.push(root)

    output
  end

  def depth(node)
    count = 0
    current_node = @root
    until current_node == node
      count += 1
      current_node = current_node.data > node.data ? current_node.left : current_node.right
    end
    count
  end

  def height(node = @root, count = -1)
    return count if node.nil?

    count += 1
    [height(node.left, count), height(node.right, count)].max
  end

  def balanced?
    (height(@root.left) - height(@root.right)).abs.between?(-1, 1)
  end

  def rebalance!
    tree = inorder.uniq.sort.map(&:data)
    @root = build_tree(tree)
  end
end