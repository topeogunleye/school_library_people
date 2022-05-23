require_relative './student'

class Store
  attr_reader :books_arr, :people_arr, :rentals_arr

  def initialize
    @books_arr = []
    @people_arr = []
    @rentals_arr = []
  end

  def book_store(book)
    @books_arr.push(book)
    @books_arr
  end

  def people_store(person)
    @people_arr.push(person)
    @people_arr
  end

  def rentals_store(rental)
    @rentals_arr.push(rental)
    @rentals_arr
  end
end

store = Store.new
student = Student.new(15, 'Daniel')

store.people_store(student)
@people_arr = store.people_arr
@people_arr.each { |person| puts "[#{person.class}]: Name: #{person.name}, ID: #{person.id} AGE: #{person.age}" }
