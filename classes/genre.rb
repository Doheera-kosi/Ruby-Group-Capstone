class Genre
  def initialize(name, id = Random.rand(10_000))
    @id = id
    @name = name
    @items = []
  end
end
