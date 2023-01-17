class MusicAlbum < Item
  def initialize(publish_date, archived, id = Random.rand(10_000))
    super(publish_date, archived, id)
  end
end
