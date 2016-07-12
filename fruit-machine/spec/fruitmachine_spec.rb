require 'fruitmachine'
describe FruitMachine do
  subject(:fruitmachine) {FruitMachine.new gambler}
  let(:gambler) {double :gambler}
  describe '#four_in_a_row' do
    it 'returns true if all the slots are equal' do
      allow(fruitmachine.wheel).to receive(:sample).and_return(:blue)
      fruitmachine.spin_the_wheel
      p fruitmachine.player_turn
      expect(fruitmachine.four_in_a_row).to be true
    end
  end
  describe '#four_different_colours' do
    it 'returns true if all 4 colours are different' do
      allow(fruitmachine.wheel).to receive(:sample).and_return(:blue)
      fruitmachine.wheel_one_spin
      p fruitmachine.player_turn
      allow(fruitmachine.wheel).to receive(:sample).and_return(:green)
      fruitmachine.wheel_one_spin
      p fruitmachine.player_turn
      allow(fruitmachine.wheel).to receive(:sample).and_return(:red)
      fruitmachine.wheel_one_spin
      p fruitmachine.player_turn
      allow(fruitmachine.wheel).to receive(:sample).and_return(:yellow)
      fruitmachine.wheel_one_spin
      p fruitmachine.player_turn
      expect(fruitmachine.four_different_colours).to be true

    end
  end
  describe "#two_or_more_adjacent" do
    it 'returns true if two or more adjacent slots are the same' do
      allow(fruitmachine.wheel).to receive(:sample).and_return(:blue)
      fruitmachine.wheel_one_spin
      p fruitmachine.player_turn
      allow(fruitmachine.wheel).to receive(:sample).and_return(:green)
      fruitmachine.wheel_one_spin
      p fruitmachine.player_turn
      allow(fruitmachine.wheel).to receive(:sample).and_return(:green)
      fruitmachine.wheel_one_spin
      p fruitmachine.player_turn
      allow(fruitmachine.wheel).to receive(:sample).and_return(:yellow)
      fruitmachine.wheel_one_spin
      p fruitmachine.player_turn
      expect(fruitmachine.two_or_more_adjacent).to be true
    end
  end
end
