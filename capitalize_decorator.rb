require './decorator'

# CapitalizeDecorator Inherits from Decorator class
class CapitalizeDecorator < Decorator
  def initialize(name)
    super(name)
    @name = name
  end

  def correct_name
    @name.correct_name.capitalize
  end
end
