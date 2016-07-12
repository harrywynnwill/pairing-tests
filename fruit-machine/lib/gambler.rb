class Gambler
  attr_reader :account

  def initialize
    @account = 0
  end
  def deposit ammount
    @account += ammount
  end
  def play_game cost
    @account -= cost
  end

end
