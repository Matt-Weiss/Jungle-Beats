require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  def test_it_exists
    node = Node.new('data')
    assert_instance_of Node, node
  end

  def test_we_can_retrieve_data
    node = Node.new('data')
    assert_equal 'data', node.data
  end

  def test_next_node_is_nil
    node = Node.new('data')
    assert_nil node.next_node
  end

end
