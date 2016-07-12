require './lib/fruitmachine.rb'
require './lib/gambler.rb'
require './lib/rules.rb'
harry = Gambler.new
fruity = FruitMachine.new harry
fruity.spin_the_wheel
fruity.four_in_a_row
fruity.player_turn
