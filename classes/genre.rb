class Genre
  attr_reader :id, :name, :items

  def initialize(name, id = Random.rand(10_000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end

  def to_json(*args)
    {
      'id' => @id,
      'name' => @name
    }.to_json(*args)
  end
end
