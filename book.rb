# Book Class
class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end
end
