class Decorator < Namable
  def initialize(name)
    super(name)
    @name = name
  end

  def correct_name
    @name.correct_name
  end
end
