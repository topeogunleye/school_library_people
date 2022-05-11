require './person'

# Teacher Class Inheriting From Person Class
class Teacher < Person
  def initialize(specialization, age, name = 'unknown', parent_permission = 'true')
    super(name, age, parent_permission)
    @specialization = specialization
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    true
  end
end
