require_relative './app'
require_relative './operations'

def run
  operations = Operations.new
  operations.user_input

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