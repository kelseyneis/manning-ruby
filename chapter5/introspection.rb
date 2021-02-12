# frozen_string_literal: true

# examining self in various contexts
class C
  puts 'Just started class C:'
  puts self
  module M
    puts 'Nested module C::M:'
    puts self
  end
  puts 'Back in the outer level of C:'
  puts self
end

# show self in a method call
class D
  def x
    puts 'Class D, method x:'
    puts self
  end
end
d = D.new
d.x
puts "That was a call to x from: #{d}"

# singleton method self is the instance of the object
obj = Object.new
def obj.show_me
  puts "Inside singleton method show_me of #{self}"
end
obj.show_me
puts "Back from call to show_me by #{obj}"

# singleton method on a class class: self is the class
class E
  def self.x
    puts 'Class method of class E'
    puts "self: #{self}"
  end
end
E.x

# alternate way to define multiple methods on a class
class F
  class << self
    def x
      # definition of x
    end

    def y
      # definition of y
    end
  end
end

# instance variables
class G
  def set_v
    @v = 'I am an instance variable and I belong to any instance of G.'
  end

  def show_var
    puts @v
  end

  def self.set_v
    @v = 'I am an instance variable and I belong to G.'
    puts @v
  end
end

G.set_v
g = G.new
g.set_v
g.show_var
