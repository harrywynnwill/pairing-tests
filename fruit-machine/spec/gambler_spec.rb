require 'gambler'
describe Gambler do
  subject(:gambler){Gambler.new}
  it 'initializes with an empty account' do
    expect(gambler.account).to eq 0
  end
  describe '#deposit' do
    it ' tops up the account of the punter' do
      gambler.deposit(10)
      expect(gambler.account).to eq 10
    end
  end
end
