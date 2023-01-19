require_relative '../classes/game'

describe Game do
  context 'When testing the Game class' do
    it 'Should return an object of the class Game' do
      game = Game.new('12-12-2012', false, true, '10-10-2019')
      expect(game.class).to eq Game
    end

    it 'Should return if the game can be moved to the archive' do
      game = Game.new('12-12-2012', false, true, '10-10-2019')
      expect(game.move_to_archive).to eq true
    end
  end
end
