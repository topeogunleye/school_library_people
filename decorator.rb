# Decorator Class inheriting from Nameable class
class Decorator < Nameable
  def initialize(name)
    super(name)
    @name = name
  end

  def correct_name
    @name.correct_name
  end
end
