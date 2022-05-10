# Student Class Inheriting From Person Class
class Student < Person
  def initialize(classroom, age, name = 'unknown', parent_permission = 'true')
    super(name, age, parent_permission)
    @classroom = classroom
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
