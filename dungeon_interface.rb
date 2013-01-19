require './dungeon'

print "Please enter your name: "
player_name = gets
#Creates a new game
@dungeon = Dungeon.new(player_name)
@dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", { :west => :smallcave })
@dungeon.add_room(:smallcave, "Small Cave", "a small cavernous cave", { :east => :largecave, :south => :smallercave })
@dungeon.add_room(:smallercave, "Smaller Cave", "a smaller cavernous cave", {:north => :largecave, :east => :smallestcave})
@dungeon.add_room(:smallestcave, "Smallest Cave", "the smallest cave", {:west => :smallercave, :east => :biggestcave})
@dungeon.add_room(:biggercave, "Bigger Cave", "a bigger cavernous cave", {:north => :biggestcave})
@dungeon.add_room(:biggestcave, "Biggest cave", "the biggest cavernous cave", {:south => :biggercave})
puts "Welcome " + @dungeon.player.name + "You are at:"
@dungeon.start(:largecave)

while input = gets
  response = @dungeon.parse_input(input)
  if(!response.nil?)
    puts ">> #{response}"
  else
    print ">> "
  end

end

