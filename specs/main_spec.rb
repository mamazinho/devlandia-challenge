# frozen_string_literal: true

require_relative '../main'

describe Main do
  describe '# Test all main' do
    it 'compare score in fixed positions' do
      game = Main.new([1, 1], [0, 0], [3, 3])
      expect(game.calc_score).to eq(0.7)
    end
  end
end
