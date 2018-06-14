# Understands docking and releasing bikes
class DockingStation
  attr_reader :store, :bikes

  def initialize
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
    @bikes.length >= 20
  end

  def empty?
    @bikes.length.zero?
  end
end
