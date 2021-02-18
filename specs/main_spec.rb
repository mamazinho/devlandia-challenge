# frozen_string_literal: true

require_relative '../main'

describe Main do
  describe '# Test all main' do
    it 'compare score in fixed positions' do
      game = Main.new([2, 2], [1, 1], [3, 3])
      expect(game.calc_result).to eq(0.7)
    end
  end
end
