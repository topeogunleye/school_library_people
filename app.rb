require_relative './classroom'
require_relative './book'
require_relative './rental'
require_relative './person'
require_relative './teacher'
require_relative './student'

# App Class that will serve as your console app entry-point.
class App
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

  def success(message)
    puts "Successfully created #{message}"
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
    @books_arr.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    main
  end

  def list_people
    @people_arr.each { |person| puts "[#{person.class}]: Name: #{person.name}, ID: #{person.id} AGE: #{person.age}" }
    main
  end

  def choice_permission
    choice = gets.chomp.downcase
    permission = true
    case choice
    when 'y'
      permission = true
    when 'n'
      permission = false
    else
      puts 'Invalid Submission'
    end
    [permission]
  end

  def create_teacher
    puts 'What is the teachers specialization?'
    subject = gets.chomp
    puts 'What is the name of the teacher?'
    name = gets.chomp
    puts 'What is the age of the teacher?'
    age = gets.chomp.to_i
    puts 'Does the teacher have permission to use the library services [Y/N]: ?'
    permission = choice_permission
    teacher = Teacher.new(subject, age, name, parent_permission: permission)
    people_store(teacher)
    success('Teacher')
  end

  def create_student
    puts 'What is the name of the student?'
    name = gets.chomp
    puts 'What is the age of the student?'
    age = gets.chomp.to_i
    puts 'Does the student have permission to use the library services?'
    permission = choice_permission
    student = Student.new(classroom, age, name, parent_permission: permission)
    people_store(student)
    success('Student')
  end

  def create_person
    puts 'Teacher (1) or Student (1)? [Enter a number]'
    type = gets.chomp.to_i
    case type
    when 1
      create_teacher
    when 2
      create_student
    else puts 'Invalid Entry'
    end
    main
  end

  def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    book_store(book)
    success('Book')
    main
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books_arr.each_with_index { |book, index| puts "#{index} Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people_arr.each_with_index do |person, index|
      puts "#{index} [#{person.class}]: Name: #{person.name}, ID: #{person.id} AGE: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print 'Enter the date [YYYY-MM-DD]: '
    date = gets.chomp
    book = @books_arr[book_index]
    person = @people_arr[person_index]
    rental = Rental.new(date, person, book)
    rentals_store(rental)
    success('Rental')
    main
  end

  def list_rentals
    puts 'Enter a person id: '
    @people_arr.each { |person| puts "#{person.name} - Person ID: #{person.id}" }
    person_id = gets.chomp.to_i
    rentals = @rentals_arr.select { |rental| rental.person.id == person_id }

    if rentals.empty?
      puts "Person with ID #{person_id} has no rentals yet"
    else
      rentals.each { |rentl| puts "Date: #{rentl.date}, Book #{rentl.book.title} by #{rentl.book.author}" }
    end
    main
  end

  def exit
    puts 'Goodbye'
  end
end

def menu_list(num)
  app = App.new
  case num
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
  end
end

def main
  app = App.new
  app.user_input

  choice = gets.chomp.to_i
  if choice.positive? && choice < 9 && choice != 7
    menu_list(choice)
  elsif choice == 7
    app.exit
  else
    puts 'Invalid input'
    main
  end
end

main
