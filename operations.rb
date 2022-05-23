require_relative './store'

class Operations
  def list_books
    store = Store.new
    books_arr = store.books_arr
    books_arr.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    run
  end

  def list_people
    store = Store.new
    store.people_arr.each do |person|
      puts "[#{person.class}]: Name: #{person.name}, ID: #{person.id} AGE: #{person.age}"
    end
    run
  end

  def user_info
    print 'Enter the name of the person: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    [name, age]
  end

  def create_teacher
    name, age = user_info
    puts 'What is the teachers specialization?'
    subject = gets.chomp
    teacher = Teacher.new(subject, age, name)
    store = Store.new
    store.people_store(teacher)
    success('Teacher')
  end

  def choice_permission
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    print 'Enter the classroom: '
    case parent_permission.upcase
    when 'Y'
      permission = true
    when 'N'
      permission = false
    else
      puts 'Invalid input'
      run
    end
    permission
  end

  def create_student
    name, age = user_info
    permission = choice_permission
    student = Student.new(age, name, parent_permission: permission)
    store = Store.new
    store.people_store(student)
    success('Student')
  end

  def create_person
    puts 'Teacher (1) or Student (2)? [Enter a number]'
    type = gets.chomp.to_i
    case type
    when 1
      create_teacher
    when 2
      create_student
    else puts 'Invalid Entry'
    end
    run
  end

  def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    store = Store.new
    store.book_store(book)
    success('Book')
    run
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
    store = Store.new
    store.rentals_store(rental)
    success('Rental')
    run
  end

  def list_rentals
    puts 'Enter a person id: '
    store = Store.new
    @people_arr = store.people_arr
    @rentals_arr = store.rentals_arr
    @people_arr.each { |person| puts "#{person.name} - Person ID: #{person.id}" }
    person_id = gets.chomp.to_i
    rentals = @rentals_arr.select { |rental| rental.person.id == person_id }

    if rentals.empty?
      puts "Person with ID #{person_id} has no rentals yet"
    else
      rentals.each { |rentl| puts "Date: #{rentl.date}, Book #{rentl.book.title} by #{rentl.book.author}" }
    end
    run
  end

  def exit
    puts 'Goodbye'
  end
end
