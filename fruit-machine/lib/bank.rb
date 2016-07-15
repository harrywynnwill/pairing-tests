class Bank

  FLOAT = 50
  COIN = 1
  FIVE = 5
  HALVE = 0.5
  NO_MONEY = "sorry the machine has no jackpot"

  attr_reader :float, :jackpot, :gambler

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
      if jackpot_empty?
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
    raise NO_MONEY if jackpot_empty?
    @gambler.credit @jackpot
    remove_from_jackpot @jackpot
  end

  def add_to_jackpot coin
     @jackpot += coin
  end

  def remove_from_jackpot coin
    @jackpot -= coin
  end

  private

  def jackpot_empty?
    @jackpot == 0
  end
end
