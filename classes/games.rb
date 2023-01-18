require_relative 'item'

# Game class inherits from Item
class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(publish_date, archived, multiplayer, last_played_at, id = Random.rand(10_000))
    super(publish_date, archived, id)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    super && (Date.today.year - @last_played_at.year) >= 2
  end

  private :can_be_archived?

  def to_json(*args)
    {
      'id' => @id,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'author' => @author
    }.to_json(*args)
  end
end
