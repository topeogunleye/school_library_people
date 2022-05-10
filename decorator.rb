class Decorator < Namable
  def initialize(component)
    super()
    @component = component
  end
end
