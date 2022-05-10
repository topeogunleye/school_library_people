# Person class
class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, parent_permission = 'true', name = 'unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private


  def can_use_services?
    of_age? || @parent_permission == true
  end

  def of_age?
    age >= 18
  end

end
