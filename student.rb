require_relative './classroom'
require_relative './person'

# Student Class Inheriting From Person Class
class Student < Person
  attr_reader :classroom
  attr_accessor :parent_permission

  def initialize(age, name = 'unknown', parent_permission: true)
    super(name, age, parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
