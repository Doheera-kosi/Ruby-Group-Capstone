require_relative './item'

class Movie < Item
  attr_reader :silent, :publish_date, :id

  def initialize(publish_date, silent: false)
    super(publish_date)
    @id = Random.rand(1..1999)
    @silent = silent
  end

  private

  def can_be_archived?
    super || @silent ? true : false
  end
end
