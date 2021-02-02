# frozen_string_literal: true

# Demonstration of class inheritance
# Superclass publication
class Publication
  attr_accessor :publisher

  def publish(article)
    puts article
  end
end

# Subclass Magazine
class Magazine < Publication
  attr_accessor :editor
end

# Sub-subclass Ezine
class Ezine < Magazine
end

magazine = Magazine.new
magazine.publisher = 'Shoestrings International'
magazine.editor = 'Cheryl Converse'
puts "The magazine, #{magazine.publisher} just got a new editor in chief, #{magazine.editor}"
magazine.publish('New shoestring recall shakes the industry')

# Examining inheritance to the top level of Object
class C
end

class D < C
end
puts D.superclass
puts D.superclass.superclass
