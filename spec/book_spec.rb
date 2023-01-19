require_relative '../classes/book'

describe Book do
  before :all do
    @book = Book.new('1998-03-15', 'Jenny', 'good')
  end

  context 'when creating a new book' do
    it 'should be an instance of book class' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'should have a cover state' do
      expect(@book.cover_state).to eq('good')
    end

    it 'should have a publisher' do
      expect(@book.publisher).to eq('Jenny')
    end

    it 'should have a publish date' do
      expect(@book.publish_date.year).to eq(1998)
    end

    it 'has can_be_archived? method' do
      expect(@book).to respond_to(:can_be_archived?)
    end

    it 'has move_to_archive method' do
      expect(@book.move_to_archive).to eq(true)
    end
  end
end
