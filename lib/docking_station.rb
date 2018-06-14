# Understands docking and releasing bikes
class DockingStation
  attr_reader :bikes
  attr_accessor :DEFAULT_CAPACITY

  def initialize(capacity=20)
    @DEFAULT_CAPACITY = capacity
    @bikes = []
  end

  def release_bike
    raise 'No bikes available!' if empty?
    @bikes.pop
  end

  def dock(bike)
    raise 'Bike dock is full!' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= @DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end
