$: << "/home/juampi/rails_projects/tests/tests"

require 'minitest/spec'
require 'minitest/autorun'
require 'dungeon'

#http://www.ruby-doc.org/stdlib-1.9.3/libdoc/minitest/unit/rdoc/MiniTest/Assertions.html
class TestDungeon < MiniTest::Unit::TestCase
  describe Dungeon do
    it "should create a new instance of Dungeon" do
      new_dungeon = Dungeon.new(@player)
      new_dungeon.must_be_instance_of(Dungeon)
    end
  end
  
  describe Dungeon::Player do
    it "should create a new instance of player" do
      new_player = Dungeon::Player.new("Player 1")
      new_player.must_be_instance_of(Dungeon::Player)
    end
  end
  
  describe Dungeon::Room do
    it "should create a new instance of room" do
      new_room = Dungeon::Room.new(:basement,"Basement","Dark Basement",{:west => :smallercave, :east => :biggestcave})
      new_room.must_be_instance_of(Dungeon::Room)
    end
  end
  
end