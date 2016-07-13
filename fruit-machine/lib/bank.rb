class Bank

  FLOAT = 50
  COIN = 1
  FIVE = 5
  HALVE = 0.5

  def initialize gambler = Gambler.new
    @gambler = gambler
    @float = FLOAT
    @jackpot = @float
  end

  def play_game coin = COIN
    @gambler.debit coin
    add_to_jackpot coin
  end

  def payout_five_times coin = COIN
    5.times do
      if @jackpot - COIN < 0
         @gambler.credit coin
      else
        @gambler.credit coin
        remove_from_jackpot coin
      end
    end
  end


  def payout_half
    @gambler.credit (HALVE * @jackpot).round
    remove_from_jackpot (HALVE * @jackpot).round
  end

  def hit_the_jackpot
    @gambler.credit @jackpot
    remove_from_jackpot @jackpot
  end





  attr_reader :float, :jackpot, :gambler



  def add_to_jackpot coin
     @jackpot += coin
  end

  def remove_from_jackpot coin
    @jackpot -= coin
  end



end
