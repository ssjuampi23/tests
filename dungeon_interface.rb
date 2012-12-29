print "Please enter your name: "
player_name = gets
puts
#Creates a new game
@dungeon = Dungeon.new(player_name)
puts @dungeon.player.name