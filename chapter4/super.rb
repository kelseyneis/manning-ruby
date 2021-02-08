# frozen_string_literal: true

# super demo
module M
  def report
    puts "'report' method in module M"
  end
end

# super triggers Module M's report method
class C
  include M
  def report
    puts "'report' method in class C"
    puts 'About to trigger the next higher-up report method...'
    super
    puts "Back from the 'super' call."
  end
end
c = C.new
c.report

# a more concrete example
class Bicycle
  attr_reader :gears, :wheels, :seats

  def initialize(gears = 1)
    @wheels = 2
    @seats = 1
    @gears = gears
  end

  def rent
    puts 'sorry, no more bicycles'
  end
end

# tandem is almost like bicycle, so we use super to run Bicycle's initialize method, then carry on with specializing it
class Tandem < Bicycle
  def initialize(gears)
    super
    @seats = 2
  end

  def rent
    puts 'one tandem available!'
  end
end

tandem = Tandem.new(2)
tandem.rent
puts tandem.method(:rent)
puts tandem.method(:rent).super_method

tandem.method(:rent).call
tandem.method(:rent).super_method.call
