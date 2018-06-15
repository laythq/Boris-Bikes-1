require_relative './bike.rb'

# Understands docking and releasing bikes
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
    released_bike = @bikes.find { |bike| bike.condition == 'working' }
    released_bike.condition
  end

  def dock(bike)
    raise 'Bike dock is full!' if full?
    @bikes << bike
  end

  def return_bike(bike)
    raise 'Bike is broken!' if bike.!working?
    dock(bike)
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
