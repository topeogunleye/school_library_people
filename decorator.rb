require './nameable'

# Decorator Class inheriting from Nameable class
class Decorator < Nameable
  def initialize(component)
    super(component)
    @component = component
  end

  def correct_name
    @name.correct_name
  end
end
