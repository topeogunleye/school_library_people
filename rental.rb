class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date, person, book)
    @date = date
  end
end
