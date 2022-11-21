require_relative 'lib/balanced_binary_search_tree'

tree = BBST.new(Array.new(15) { rand(1..100) })

puts tree.balanced?

tree.level_order.each { |node| puts node.data }
tree.postorder.each { |node| puts node.data }
tree.preorder.each { |node| puts node.data }
tree.inorder.each { |node| puts node.data }

tree.insert(105)
tree.insert(120)
tree.insert(131)
tree.insert(107)
puts tree.balanced? == false

tree.rebalance!
puts tree.balanced?

tree.level_order.each { |node| puts node.data }
tree.postorder.each { |node| puts node.data }
tree.preorder.each { |node| puts node.data }
tree.inorder.each { |node| puts node.data }
