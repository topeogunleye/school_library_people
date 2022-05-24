class Dog
  def walking
    'walking'
  end

  def speak
    'woof'
  end
end

class JackRusselTerrier < Dog
  def speak
    'Arff'
  end
end

sam = JackRusselTerrier.new
puts sam.walking
