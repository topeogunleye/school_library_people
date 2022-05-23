class Dog
  def walking
    return "walking"
  end

  def speak
    return "woof"
  end
end

class JackRusselTerrier < Dog
  def speak
    return "Arff"
  end
end

sam = JackRusselTerrier.new()
puts sam.walking
