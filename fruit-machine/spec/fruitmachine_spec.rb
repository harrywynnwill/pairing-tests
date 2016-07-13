require 'fruitmachine'
require 'rules'

describe FruitMachine do
  subject(:fruitmachine) { FruitMachine.new bank {include Rules}}
  let(:bank) {double :bank}
  describe '#all_the_same_colour' do
    it 'returns true if all the slots are the same' do
      allow(fruitmachine.wheel).to receive(:sample).and_return(:blue)
      fruitmachine.spin_the_wheel
      expect(fruitmachine.all_the_same_colour fruitmachine.player_turn).to be true
    end
  end
  describe '#all_different_colours' do
    it 'returns true if all 4 colours are different' do
      allow(fruitmachine.wheel).to receive(:sample).and_return(:blue)
      fruitmachine.wheel_one_spin
      allow(fruitmachine.wheel).to receive(:sample).and_return(:green)
      fruitmachine.wheel_one_spin
      allow(fruitmachine.wheel).to receive(:sample).and_return(:red)
      fruitmachine.wheel_one_spin
      allow(fruitmachine.wheel).to receive(:sample).and_return(:yellow)
      fruitmachine.wheel_one_spin
      expect(fruitmachine.all_different_colours fruitmachine.player_turn).to be true

    end
  end
  describe "#two_or_more_adjacent" do
    it 'returns true if two or more adjacent slots are the same' do
      allow(fruitmachine.wheel).to receive(:sample).and_return(:blue)
      fruitmachine.wheel_one_spin
      allow(fruitmachine.wheel).to receive(:sample).and_return(:green)
      fruitmachine.wheel_one_spin
      allow(fruitmachine.wheel).to receive(:sample).and_return(:green)
      fruitmachine.wheel_one_spin
      allow(fruitmachine.wheel).to receive(:sample).and_return(:yellow)
      fruitmachine.wheel_one_spin
      expect(fruitmachine.two_or_more_adjacent_colours fruitmachine.player_turn).to be true
    end
  end
end
