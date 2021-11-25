# rubocop:disable Layout/LineLength
require './item'
# Create class Book
class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :publish_date

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_s
    "Publisher\'s name : \"#{@publisher}\" ~ Published on : #{@publish_date} ~ Cover state: #{cover_state ? 'Good state' : 'Bad state'}"
  end

  private

  def can_be_archived?
    @cover_state == 'bad' || super
  end
end
# rubocop:enable Layout/LineLength
