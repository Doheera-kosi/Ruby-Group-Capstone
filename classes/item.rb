class Item
  def initialize(publish_date, archived, id = Random.rand(10_000))
    @id = id
    @publish_date = publish_date
    @archived = archived
  end
end
