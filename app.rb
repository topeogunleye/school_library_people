require_relative './student'
require_relative './classroom'
require_relative './rental'
require_relative './person'
require_relative './book'

maria = Person.new(45, 'Maria German')
john = Person.new(58, 'John Doe')

book_1 = Book.new('Jack Sparrow', 'James Bond')
book_2 = Book.new('Evil Forest', 'Maria Carrie')

rental_1 = Rental.new('2017-12-22', john, book_1 )
rental_2 = Rental.new('2017-12-31', maria, book_1)

puts john.correct_name
puts book_1.author
puts book_2.title
puts book_1.rentals
