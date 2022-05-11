require './decorator'

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
