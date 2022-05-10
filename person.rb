class Person
  def initialize(age, parent_permission='true', name='unknown')
  @id = Random.rand(1..1000)
  @name = name
  @age = age
  @parent_permission = parent_permission
end
