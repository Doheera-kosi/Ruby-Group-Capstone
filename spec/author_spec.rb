require_relative '../classes/author'

describe Author do
  context 'When testing the Author class' do
    it 'Should return an object of the class Author' do
      author = Author.new('Someone', 'Somebody')
      expect(author.class).to eq Author
    end

    it 'Should add an item to the author\s items\' list' do
      author = Author.new('Someone', 'Somebody')
      game = Game.new('12-12-2012', false, true, '10-10-2019')
      game.author = author
      author.add_item(game)
      expect(author.items.length).to eq 1
    end
  end
end
