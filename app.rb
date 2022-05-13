require_relative './student'
require_relative './classroom'
require_relative './rental'
require_relative './person'
require_relative './book'

maria = Person.new(45, 'Maria German')
john = Person.new(58, 'John Doe')

BOOK1 = Book.new('Jack Sparrow', 'James Bond')
BOOK2 = Book.new('Evil Forest', 'Maria Carrie')

RENTAL1 = Rental.new('2017-12-22', john, BOOK1)
RENTAL2 = Rental.new('2017-12-31', maria, BOOK2)

puts john.correct_name
puts BOOK1.author
puts BOOK2.title
puts BOOK1.rentals
