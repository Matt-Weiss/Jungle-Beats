require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/linked_list'
require './lib/jungle_beat'
require 'pry'

class JungleBeatTest < Minitest::Test

  def test_it_initializes_properly
    jb = JungleBeat.new

    assert_instance_of JungleBeat, jb
    assert_instance_of LinkedList, jb.list
  end

  def test_it_can_append_multiple_beats_properly
    jb = JungleBeat.new
    jb.append("deep doo ditt")

    assert_equal 3, jb.list.count
    assert_equal "deep", jb.list.head.data

    jb.append("woo hoo shu")
    assert_equal 6, jb.list.count
  end

  def test_plays_audio
    jb = JungleBeat.new
    jb.append("ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom")

    jb.play
    #listen for audio, I guess
  end
end
