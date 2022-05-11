require './nameable'
require './person'

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

# CapitalizeDecorator Inherits from Decorator class
class CapitalizeDecorator < Decorator
  def initialize(component)
    super(component)
    @component = component
  end

  def correct_name
    @component.correct_name.capitalize
  end
end

# TrimmerDecorator inherits from Decorator class
class TrimmerDecorator < Decorator
  def initialize(component)
    super(component)
    @component = component
  end

  def correct_name
    @component.correct_name[0..9]
  end
end
