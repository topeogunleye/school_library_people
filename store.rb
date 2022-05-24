require_relative './student'

module Store
  @books_arr = []
  @people_arr = []
  @rentals_arr = []

  def self.book_store(book)
    @books_arr.push(book)
    @books_arr
  end

  def self.people_store(person)
    @people_arr.push(person)
    @people_arr
  end

  def self.rentals_store(rental)
    @rentals_arr.push(rental)
    @rentals_arr
  end

  def self.books_arr
    @books_arr
  end

  def self.people_arr
    @people_arr
  end

  def self.rentals_arr
    @rentals_arr
  end
end
