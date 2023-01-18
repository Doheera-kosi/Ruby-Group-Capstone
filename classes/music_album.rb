require_relative 'item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(publish_date, archived, id = Random.rand(10_000))
    super(publish_date, archived, id)
    @on_spotify = false
  end

  def can_be_archived?
    super && @on_spotify
  end
end
