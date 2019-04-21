require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/linked_list'
require 'pry'

class LinkedListTest < Minitest::Test
  def test_it_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_head_starts_as_nil
    list = LinkedList.new

    assert_nil list.head
  end

  def test_we_can_append_a_single_node
    list = LinkedList.new
    list.append("doop")

    assert_equal "doop", list.head.data
  end

  def test_we_can_count_a_single_node
    list = LinkedList.new
    list.append("doop")

    assert_equal 1, list.count
  end

  def test_we_can_convert_list_to_string
    list = LinkedList.new
    list.append("doop")

    assert_equal "doop", list.to_string
  end

  def test_we_can_append_multiple_nodes
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    assert_equal 2, list.count
    assert_equal "doop deep", list.to_string
  end

  def test_we_can_prepend_a_note_to_head_of_list
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.prepend("bop")

    assert_equal 3, list.count
    assert_equal "bop doop deep", list.to_string
  end

  def test_we_can_insert_a_node_anywhere
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.insert(1, "dip")

    assert_equal 3, list.count
    assert_equal "doop dip deep", list.to_string
  end

  def test_we_can_find_beats_based_on_index
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "shi", list.find(2,1)
    assert_equal "woo shi shu", list.find(1,3)
  end

  def test_we_can_search_the_list_for_data
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert list.includes?("deep")
    refute list.includes?("dep")
  end

  def test_we_can_remove_tail
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")
    list.pop

    refute list.includes?("blop")
  end

end
