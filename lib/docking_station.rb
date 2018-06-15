# Understands docking and releasing bikes
#require './bike.rb'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise 'No bikes available!' if empty?
    @bikes.each.with_index do |x,y|
                #print x.to_a[1]
                if x.include? "working"

                  released_bike = @bikes.delete_at(y)
                  break
                end
              end
                #return @bikes
  end

  def dock(bike)
    raise 'Bike dock is full!' if full?
    @bikes << bike
  end

  def return_bike(bike, condition)
    bike1 = [bike, condition]
    dock(bike1)
    bike1
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end

#dock = DockingStation.new
#dock.dock([Bike.new, "quarter broken"])
#puts dock.bikes.join(" ")

#dock.dock([Bike.new, "half broken"])
#puts dock.bikes.join(" ")

#dock.dock([Bike.new, "working"])
#puts dock.bikes.join(" ")

#dock.dock([Bike.new, "broken"])
#puts dock.bikes.join(" ")

#dock.release_bike
#puts dock.bikes.join(" ")
