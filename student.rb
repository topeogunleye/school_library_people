# Student Class Inheriting From Person Class
class Student < Person
  def initialize(classroom, age, parent_permission = 'true', name = 'unknown')
    super(name, age, parent_permission = 'true')
    @classroom = classroom
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
