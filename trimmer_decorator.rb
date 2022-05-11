require './decorator'

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
