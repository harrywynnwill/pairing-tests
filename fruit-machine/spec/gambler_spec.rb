require 'gambler'
describe Gambler do
  subject(:gambler){Gambler.new}


  it 'initializes with 20 coins' do
    expect(gambler.account).to eq 20
  end
  describe '#debit' do
    it 'debits the account of the punter' do
      gambler.debit(10)
      expect(gambler.account).to eq 10
    end
  end
  describe '#credit' do
    it ' tops up the account of the punter' do
      gambler.credit(10)
      expect(gambler.account).to eq 30
    end
  end
end
