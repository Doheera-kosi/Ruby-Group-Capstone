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

  def to_json(*args)
    {
      'id' => @id,
      'archived' => @archived,
      'cover_state' => @cover_state,
      'publisher' => @publisher,
      'publish_date' => @publish_date,
      'label' => @label
    }.to_json(*args)
  end
end
