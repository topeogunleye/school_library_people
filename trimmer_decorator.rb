require './decorator'

# TrimmerDecorator inherits from Decorator class
class TrimmerDecorator < Decorator
  def initialize(name)
    super(name)
    @name = name
  end

  def correct_name
    @name.correct_name[0..9]
  end
end
