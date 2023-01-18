require_relative 'item'

class Book < Item
  attr_reader :publish_date, :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state, id = Random.rand(10_000))
    super(publish_date, false, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
