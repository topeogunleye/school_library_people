require_relative './student'

class Store
  attr_reader :books_arr, :people_arr, :rentals_arr

  def initialize
    @books_arr = []
    @people_arr = []
    @rentals_arr = []
  end
module Store
  @books_arr = []
  @people_arr = []
  @rentals_arr = []

  def book_store(book)
    @books_arr.push(book)
@ -23,11 +19,18 @@ class Store
    @rentals_arr.push(rental)
    @rentals_arr
  end
end

store = Store.new
student = Student.new(15, 'Daniel')
  def books_arr
    @books_arr
  end

  def people_arr
    @people_arr
  end

  def rentals_arr
    @rentals_arr
  end
end

store.people_store(student)
@people_arr = store.people_arr
@people_arr.each { |person| puts "[#{person.class}]: Name: #{person.name}, ID: #{person.id} AGE: #{person.age}" }
include Store