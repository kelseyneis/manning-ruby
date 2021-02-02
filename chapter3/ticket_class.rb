# frozen_string_literal: true

# Ticket class, demonstrating instance methods (i.e. event)
class Ticket
  # attr_accessor combines attr_reader and attr_writer!
  attr_accessor :venue
  attr_reader :date, :price

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

ticket = Ticket.new
ticket.venue = 'some theater'
ticket.date = '2021-02-04'
ticket.price = 7.00
ticket.discount(15)

ballet = Ticket.new
ballet.venue = 'some other theater'
ballet.price = 9.00

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
