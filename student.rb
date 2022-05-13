require_relative './classroom'
require_relative './person'

# Student Class Inheriting From Person Class
class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    super(name, age, parent_permission: true)
    @classroom = classroom
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
