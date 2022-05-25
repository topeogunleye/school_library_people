require_relative './book'
require_relative './person'
require_relative './student'
require_relative './rental'
require_relative './teacher'
require_relative './operations'

# App Class that will serve as your console app entry-point.

def menu_list(num)
  case num
  when 1
    Operations.list_books
  when 2
    Operations.list_people
  when 3
    Operations.create_person
  when 4
    Operations.create_book
  when 5
    Operations.create_rental
  when 6
    Operations.list_rentals_by_person_id
  end
end
