class Car
  attr_reader :make
  attr_writer :total_count

  def self.total_count
    @total_count ||= 0
  end

  def self.add_make(make)
    unless @makes.include?(make)
      @makes << make
      @cars[make] = 0
    end
  end

  def initialize(make)
    if @makes.include?(make)
      puts "Creating a new #{make}!"
      @make = make
      @cars[make] += 1
      self.class.total_count += 1
    else
      raise "No such make: #{make}."
    end
  end

  def make_mates
    @cars[self.make]
  end
end
