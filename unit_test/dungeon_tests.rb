
require 'minitest/spec'
require 'minitest/autorun'
require_relative '../dungeon'

#http://www.ruby-doc.org/stdlib-1.9.3/libdoc/minitest/unit/rdoc/MiniTest/Assertions.html
class TestDungeon < MiniTest::Unit::TestCase
  describe Dungeon do
    
    before{
      @new_dungeon = Dungeon.new("Player 1")
      @new_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", { :west => :smallcave })
      @new_dungeon.add_room(:smallcave, "Small Cave", "a small cavernous cave", { :east => :largecave, :south => :smallercave })
      @new_dungeon.add_room(:smallercave, "Smaller Cave", "a smaller cavernous cave", {:north => :largecave, :east => :smallestcave})
      @new_dungeon.add_room(:smallestcave, "Smallest Cave", "the smallest cave", {:west => :smallercave, :east => :biggestcave})
      @new_dungeon.add_room(:biggercave, "Bigger Cave", "a bigger cavernous cave", {:north => :biggestcave})
      @new_dungeon.add_room(:biggestcave, "Biggest cave", "the biggest cavernous cave", {:south => :biggercave})
      @new_dungeon.start(:smallercave)
    }
    
    it "should create a new instance of Dungeon" do
      @new_dungeon.must_be_instance_of(Dungeon)
    end
    
    it "should create a new instance of Player" do
      @new_dungeon.player.must_be_instance_of(Dungeon::Player)
    end
    
     it "should find a requested Room" do
       myroom = @new_dungeon.find_room_in_dungeon(:biggestcave)
       myroom.must_be_instance_of(Dungeon::Room)
       myroom.name.must_equal "Biggest cave"
     end
    
     it "should set the starting point of the player" do    
       @new_dungeon.player.location.must_equal(:smallercave)
     end
    
    it "should set the next location of the player" do
       @new_dungeon.go(:east) 
       @new_dungeon.player.location.must_equal(:smallestcave)
    end
     
  end #describe Dungeon
  
   describe Dungeon::Player do
   
   before{
       @new_player = Dungeon::Player.new("Player 1")
       }
        
    it "should create a new instance of player" do
       @new_player.must_be_instance_of(Dungeon::Player)    
     end
     
    it "when a new instance of player is created it should not be empty" do 
      @new_player.name.wont_be_empty
    end
    
    it "should set the location of the player" do
      @new_player.location = "street"
      @new_player.location.wont_be_empty
    end
    
   end #describe Player
   
   describe Dungeon::Room do
     
     before{
       @new_room = Dungeon::Room.new(:basement,"Basement","Dark Basement",{:west => :smallercave, :east => :biggestcave})
       }
     
     it "should create a new instance of room" do
       @new_room.must_be_instance_of(Dungeon::Room)
     end
     
     it "should display a full description of the room" do
       @new_room.full_description.must_equal "Basement\n\nYou are in Dark Basement"
     end
     
     it "should display the name of the room" do
       @new_room.name.must_equal "Basement"
     end
     
     it "should display the reference of the room" do
       @new_room.reference.must_equal :basement
     end
     
     it "should display a connection of the room" do
       @new_room.connections[:west]
     end
     
   end #describe Room 
  
end