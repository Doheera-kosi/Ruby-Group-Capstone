require_relative 'game'

# Author class
class Author
  attr_reader :first_name, :last_name, :id, :items

  def initialize(first_name, last_name, id = Random.rand(10_000))
    @first_name = first_name
    @last_name = last_name
    @id = id
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.author = self
  end

  def to_json(*args)
    {
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name
    }.to_json(*args)
  end
end
