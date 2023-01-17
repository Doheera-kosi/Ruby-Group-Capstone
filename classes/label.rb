class Label
  def initialize(title, color, id = Random.rand(10_000))
    @id = id
    @items = []
    @title = title
    @color = color
  end
end
