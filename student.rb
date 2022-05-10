class Student < Person
  def initialize(classroom, age, parent_permission = true , name = "unknown")
    super(age, name, parent_permission)
    @classroom = classroom
    @age = age
    @parent_permission = parent_permission
    @name = name
  end
end
