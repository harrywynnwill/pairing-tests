class Gambler
  attr_reader :account

    DEFAULT_CREDIT = 20

  def initialize ammount = DEFAULT_CREDIT
    @account = ammount
  end
  
  def debit ammount
    @account -= ammount
  end

  def credit ammount
    @account += ammount
  end
end
