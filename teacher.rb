# Teacher Class Inheriting From Person Class
class Teacher < Person
  def initialize(specialization)
    super
    @specialization = specialization
  end

end
