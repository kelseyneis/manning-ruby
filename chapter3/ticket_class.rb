# frozen_string_literal: true

# Ticket class, demonstrating instance methods (i.e. event)
class Ticket
  # Constants
  VENUES = ['Convention Center', 'Fairgrounds', 'Town Hall']
  # attr_accessor combines attr_reader and attr_writer!
  def initialize(venue)
    if VENUES.include?(venue)
      @venue = venue
    else
      raise ArgumentError, "Unknown venue #{venue}"
    end
  end

  attr_reader :date, :price, :venue

  def date=(date)
    @date = date.match(/\d{4}-\d{2}-\d{2}/) ? date : (puts 'Please format date yyyy-mm-dd')
  end

  def price=(amount)
    @price = (amount * 100).to_i == amount * 100 ? amount : (puts 'The price seems to be malformed')
  end

  def discount(discount)
    self.price = @price.to_f * (100 - discount) / 100 unless @price.nil?
  end

end

Ticket::VENUES << 'High School Gym'

puts 'The venues are:'
puts Ticket::VENUES

ticket = Ticket.new('Convention Center')
ticket.date = '2021-02-04'
ticket.price = 7.00
ticket.discount(15)

ballet = Ticket.new('Fairgrounds')
ballet.price = 9.00

# Class singleton method. Unlike instance methods, such as date, price and venue above, these are called on the class itself (Ticket) rather than on an instance of the class (ticket, ballet)
def Ticket.most_expensive(*tickets)
  tickets.max_by(&:price)
end

puts "The highest price ticket is at #{Ticket.most_expensive(ticket, ballet).venue}"

puts "The first is for a #{ticket.venue} event on #{ticket.date}, costing $#{"%.2f" % ticket.price}."
puts "The second is for an event on #{ballet.date} at #{ballet.venue}, costing $#{"%.2f" % ballet.price}."

# Other random tidbits from chapter 3 :)
# Singleton method, not part of any class
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
  def name=(string)
    puts "Setting person's name..."
    @name = string
  end

  attr_reader :name
end

joe = Person.new
joe.name = 'Joe'
puts joe.name

# Date normalizing
class TravelAgentSession
  def year=(y)
    @year = y.to_i
    @year += 2000 if @year < 100
  end

  def year_from_date(date)
    year, month, day = date.split('-')
    self.year = year
  end
end

puts TravelAgentSession.new.year_from_date('2021-02-09')
