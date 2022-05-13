require_relative './classroom'
require_relative './book'
require_relative './rental'
require_relative './person'
require_relative './teacher'
require_relative './student'

# App Class that will serve as your console app entry-point.
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def user_input
    puts 'Welcome to School Library App'
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def list_books

  end

  def list_people

  end

  def create_person
    puts 'What type of person would you like to create?'
    puts '1. Teacher'
    puts '2. Student'
    type = gets.chomp.to_i
    case type
    when 1
      puts 'What subject does the teacher take?'
      subject = gets.chomp
      puts 'What is the age of the teacher?'
      age = gets.chomp.to_i
      puts 'What is the name of the teacher?'
      name = gets.chomp
      puts 'Does the teacher have permission to use the library services?'
      permission = gets.chomp.to_i
      teacher = Teacher.new(subject, age, name, parent_permission: permission)
      @people.push(teacher)
    when 2
      puts 'What classroom is the student?'
      classroom = gets.chomp
      puts 'What is the age of the student?'
      age = gets.chomp.to_i
      puts 'What is the name of the student?'
      name = gets.chomp
      puts 'Does the student have permission to use the library services?'
      permission = gets.chomp.to_i
      student = Student.new(classroom, age, name, parent_permission: permission)
      @people.push(student)
    else
      puts 'Invalid Entry'
    end
  end

  def create_book
    puts 'What is the book title ?'
    title = gets.chomp
    puts 'What is the book author ?'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
  end

  def create_rental

  end

  def list_rentals

  end

  def exit

  end
end

def main
  app = App.new
  app.user_input

  choice = get.chomp.to_i

  case choice
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals
  when 7
    app.exit
  else
    puts 'Invalid Entry'
  end
end

main
