# frozen_string_literal: true

ticket = Object.new

def ticket.date
  '1903-01-02'
end

def ticket.venue
  'Town Hall'
end

def ticket.event
  "Author's reading"
end

def ticket.performer
  'Mark Twain'
end

def ticket.seat
  'Second Balcony, row J, seat 12'
end

def ticket.price
  5.50
end

def ticket.available?
  false
end

# Loop with optional array parameter
def ticket.details(*parms)
  parms.each { |detail| puts "This ticket is #{detail}" }
end

ticket.details('for Mark Twain', '$7', 'at the Ordway Theater')

if ticket.available?
  puts "you're in luck! a ticket is available."
else
  puts 'sorry buddy, no tickets'
end

puts "This ticket is for: #{ticket.event}, at #{ticket.venue}.\n" \
     "The performer is #{ticket.performer}.\n" \
     "The seat is #{ticket.seat}, " \
     "and it costs $#{'%.2f.' % ticket.price}"

# puts ticket.methods.sort
# chomp adds a new line after the input
request = gets.chomp
if ticket.respond_to?(request)
  puts ticket.send(request)
else
  puts 'No such information available'
end

def ticket.purchase(*people)
  people.each do |i|
    puts i
  end
end

people = gets.to_s
ticks = people.split(',')
ticket.purchase(ticks)
