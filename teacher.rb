# Teacher Class Inheriting From Person Class
class Teacher < Person
  def initialize(specialization)
    super(name, age, parent_permission = 'true')
    @specialization = specialization
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    true
  end
end
