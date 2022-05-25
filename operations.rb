require_relative './store'
require_relative './helper'
require 'json'
require_relative './run'


class Operations
  def self.push(item)
    if item.is_a?(Person)
      Helper.create_file_if_not_exist('people.json')
      people_arr = Helper.read_convert('people.json')

      if item.instance_of?(Student)
        people_arr.push({ class: item.class, 'name' => item.name, 'id' => item.id, 'age' => item.age,
                          'parent_permission' => item.parent_permission, 'rentals' => item.rentals })
      else
        people_arr.push({ class: item.class, 'name' => item.name, 'id' => item.id, 'age' => item.age,
                          'specialization' => item.specialization, 'rentals' => item.rentals })
      end

      File.write('people.json', people_arr.to_json)
    else
      Helper.create_file_if_not_exist('books.json')
      books_arr = Helper.read_convert('books.json').push({ 'title' => item.title, 'author' => item.author })
      File.write('books.json', books_arr.to_json)
    end
  end

  def self.list_books
    if File.exist?('books.json')
      JSON.parse(File.read('books.json')).each do |book|
        puts "Title: #{book['title']}, Author: #{book['author']}"
      end
    else
      File.open('books.json', 'w')
      File.write('books.json', '[]')
    end
    run
  end

  def self.list_people
    if File.exist?('people.json')
      JSON.parse(File.read('people.json')).each do |person|
        puts "Type: #{person['class']}, Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end
    else
      File.open('people.json', 'w')
      File.write('people.json', '[]')
    end
    run
  end

  def self.create_person
    puts 'Student (1) or Teacher (2)? [Enter a number]'
    option = gets.chomp
    case option.to_i
    when 1
      Helper.create_student
    when 2
      Helper.create_teacher
    else puts 'Invalid input'
    end
    run
  end

  def self.create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    push(book)
    Helper.success('Book')
    run
  end

  def self.divide_create_rental
    Helper.create_file_if_not_exist('books.json')
    books_arr = JSON.parse(File.read('books.json'))
    puts 'Select a book from the following list by number'
    books_arr.each_with_index { |book, index| puts "#{index} Title: #{book['title']}, Author: #{book['author']}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    if File.exist?('people.json')
      people_arr = JSON.parse(File.read('people.json'))
    else
      File.open('people.json', 'w')
      File.write('people.json', '[]')
    end
    people_arr.each_with_index do |person, index|
      puts "#{index} [#{person['class']}]: Name: #{person['name']}, ID: #{person['id']} AGE: #{person['age']}"
    end
    person_index = gets.chomp.to_i
    [book_index, person_index, people_arr, books_arr]
  end

  def self.create_rental
    book_index, person_index, people_arr, books_arr = divide_create_rental
    print 'Enter the date [YYYY-MM-DD]: '
    date = gets.chomp
    Helper.create_file_if_not_exist('rentals.json')
    rentals_arr = JSON.parse(File.read('rentals.json'))
    book = books_arr[book_index]
    person = people_arr[person_index]
    rental = Rental.new(date, person, book)
    new_people_arr = people_arr.each do |item|
      if item['id'] == person['id']
        person['rentals'] << { 'date' => rental.date, 'author' => rental.book['author'],
                               'title' => rental.book['title'] }
      end
    end
    File.write('people.json', new_people_arr.to_json)
    json_rental = rentals_arr.push({ 'date' => rental.date, 'person' => rental.person['id'],
                                     'book' => rental.book['id'] })
    File.write('rentals.json', json_rental.to_json)
    Helper.success('Rental')
    run
  end

  def self.list_rentals_by_person_id
    puts 'Enter a person id: '
    JSON.parse(File.read('people.json')).each do |person|
      puts "Type: #{person['class']}, Name: #{person['name']} - ID: #{person['id']}"
    end
    person_id = gets.chomp.to_i
    person = JSON.parse(File.read('people.json')).find { |prsn| prsn['id'] == person_id }
    rentals = person['rentals']
    if rentals.empty?
      puts "Person with ID #{person_id} has no rentals yet"
    else
      rentals.each { |rentl| puts "Date: #{rentl['date']}, Book #{rentl['title']} by #{rentl['author']}" }
    end
    run
  end
end

