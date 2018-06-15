require_relative './bike.rb'

# Understands docking and releasing bikes
class DockingStation
  DEFAULT_CAPACITY = 20

  attr_accessor :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @active_bikes = []
    @broken_bikes = []
  end

  def release_bike
    raise 'No bikes available!' if empty?
    released_bike = @bikes.find { |bike| bike.condition == 'working' }
    released_bike
  end

  def dock(bike)
    raise 'Bike dock is full!' if full?
    raise 'Bike is broken!' unless bike.working?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
