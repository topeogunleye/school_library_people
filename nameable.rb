# Nameable class
class Nameable
  def initialize(name = 'unknown')
    @name = name
  end

  def correct_name
    raise NotImplementedError "#{self.class} has not implemented method '#{__method__}'"
  end
end
