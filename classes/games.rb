class Game < Item
  def initialize(publish_date, archived, multiplayer, last_played_at, id = Random.rand(10_000))
    super(publish_date, archived, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
end
