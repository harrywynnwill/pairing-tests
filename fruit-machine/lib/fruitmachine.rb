require_relative 'rules'

class FruitMachine

  include Rules

  attr_reader :colours, :player_turn, :wheel, :bank

  WHEEL = [:red, :green, :blue, :yellow]
  SLOTS = 4

  def initialize bank = Bank.new
    @bank = bank
    @player_turn = []
    @wheel = WHEEL
  end

  def spin_the_wheels
    SLOTS.times { wheel_one_spin }
    player_turn
  end

  def wheel_one_spin
    @player_turn << @wheel.sample
  end

  def insert_coin
    @bank.play_game
  end

  def show_balance
    @bank.gambler.account
  end

  def result_of_spin
    return @bank.hit_the_jackpot if all_the_same_colour @player_turn
    return @bank.payout_five_times if two_or_more_adjacent_colours @player_turn
    return @bank.payout_half if all_different_colours @player_turn
  end

end
