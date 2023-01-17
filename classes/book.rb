class Book < Item
  def initialize(publish_date, publisher, cover_state, id = Random.rand(10_000))
    super(publish_date, false, id)
    @publisher = publisher
    @cover_state = cover_state
  end
end
