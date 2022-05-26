require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  context 'Testing the Rental class' do
    date = '2022/03/16'
    person = Person.new(23, 'Anuar')
    book = Book.new('Harry Potter', 'JK Rowling')
    rental = Rental.new(date, person, book)

    it 'should have a class of Rental' do
      expect(rental.instance_of?(Rental)) == true
    end

    it 'Person should have a class of Person' do
      expect(rental.person.instance_of?(Person)) == true
    end

    it 'should have the right name Anuar' do
      expect(rental.person.name) == 'Anuar'
    end

    it 'Book should have a class of Book' do
      expect(rental.book.instance_of?(Book)) == true
    end
  end
end
