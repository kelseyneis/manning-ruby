# frozen_string_literal: true

# extend a module to make use methods as class methods rather than instance methods
module Convertible
  def c2f(celsius)
    celsius * 9.0 / 5 + 32
  end

  def f2c(fahrenheit)
    (fahrenheit - 32) * 5 / 9.0
  end
end

class Thermometer
  extend Convertible
end

puts Temperature.c2f(100)
puts Temperature.f2c(212)
