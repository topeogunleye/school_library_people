require_relative './app'
require_relative './operations'

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

def run
  user_input

  choice = gets.chomp.to_i
  if choice.positive? && choice < 9 && choice != 7
    menu_list(choice)
  elsif choice == 7
    exit
  else
    puts 'Invalid input'
    main
  end
end