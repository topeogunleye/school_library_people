require './operations'

class Helper
  def self.user_info
    print 'Enter the name of the person: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    [name, age]
  end

  def self.choice_permission
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

  def self.create_student
    name, age = user_info
    permission = choice_permission
    student = Student.new(age, name, parent_permission: permission)
    Operations.push(student)
    success('Student')
  end

  def self.create_teacher
    name, age = user_info
    puts 'What is the teachers specialization?'
    subject = gets.chomp
    teacher = Teacher.new(subject, age, name)
    Operations.push(teacher)
    success('Teacher')
  end

  def self.create_person
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

  def self.create_file_if_not_exist(file_name)
    return if File.exist?(file_name)

    File.open(file_name, 'w')
    File.write(file_name, '[]')
  end

  def self.read_convert(filename)
    JSON.parse(File.read(filename))
  end

  def self.success(message)
    puts "Successfully created #{message}"
  end
end
