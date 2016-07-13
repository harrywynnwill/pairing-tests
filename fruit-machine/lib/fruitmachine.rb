

class FruitMachine

  attr_reader :colours, :player_turn, :wheel

  WHEEL = [:red, :green, :blue, :yellow]
  SLOTS = 4
  # WHEEL_TWO = [:red, :green, :blue, :yellow]
  # WHEEL_THREE = [:red, :green, :blue, :yellow]
  # WHEEL_FOUR = [:red, :green, :blue, :yellow]

  def initialize gambler = Gambler , rules = Rules
    @wheel = WHEEL
    @gambler = gambler
    @rules = rules
    # @wheel_two = WHEEL_TWO
    # @wheel_three = WHEEL_THREE
    # @wheel_four = WHEEL_FOUR
    @player_turn = []
  end

  #add the wheel to a module and inherit it to player and fruitmachine

  def spin_the_wheel
    SLOTS.times { wheel_one_spin }
  end

  def wheel_one_spin
    @player_turn << @wheel.sample
  end


  def four_in_a_row
    @player_turn.all? {|slot| slot == @player_turn[0]}
  end
  def four_different_colours
    @player_turn.uniq.length == SLOTS
  end

  def insert_coin coin
    @gambler.play_game coin
  end

  def win_coin coin
    @gambler.deposit coin
  end

  def two_or_more_adjacent
    @player_turn.each_cons(2).any? {|slot_a, slot_b| slot_a == slot_b }
  end

   #
   def win_coins
    four_in_a_row ? win_coin(100) : insert_coin(1)
    two_or_more_adjacent ? win_coin(50): insert_coin(1)
    four_different_colours ? win_coin(90): insert_coin(1)
    # ? @gambler.deposit 5  : @gambler.withdraw
   end

end
