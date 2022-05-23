require_relative './book'
require_relative './person'
require_relative './student'
require_relative './rental'
require_relative './teacher'
require_relative './operations'

# App Class that will serve as your console app entry-point.

def success(message)
  puts "Successfully created #{message}"
end

def menu_list(num)
  operations = Operations.new
  case num 
  when 1
    operations.list_books
  when 2
    operations.list_people
  when 3
    operations.create_person
  when 4
    operations.create_book
  when 5
    operations.create_rental
  when 6
    operations.list_rentals
  end
end
