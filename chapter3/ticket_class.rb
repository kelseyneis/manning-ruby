# frozen_string_literal: true

# Ticket class, demonstrating instance methods (i.e. event)
class Ticket
  def initialize(venue,date)
    @venue = venue
    @date = date
  end

  attr_reader :venue, :date

  def event
    "Can't really be specified yet..."
  end
end

ticket = Ticket.new('some theater', '2021-02-04')
puts ticket.event

ballet = Ticket.new('some other theater', '2021-06-04')
puts ballet.event

puts "The first is for a #{ticket.venue} event on #{ticket.date}."
puts "The second is for an event on #{ballet.date} at #{ballet.venue}."

# Singleton method
def ballet.dancers
  'Polina Ligevsky'
end

puts "The dancer for the upcoming ballet is #{ballet.dancers}"

# Method overriding
class C
  def m
    puts 'First definition of method m'
  end
  def m
    puts 'Second definition of method m'
  end
end

print C.new.m

# Extend Ruby Time by reopening the class
class Time
  # Add a method to Time
  def time_override
    puts 'time overlord'
  end
end

Time.new.time_override

# Instance variables, here @name
class Person
  def set_name(string)
    puts "Setting person's name..."
    @name = string
  end

  def get_name
    puts "Returning the person's name..."
    @name
  end
end
joe = Person.new
joe.set_name('Joe')
puts joe.get_name
