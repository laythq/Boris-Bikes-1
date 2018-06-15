# Understands whether it is working or docked
class Bike
  attr_accessor :condition

  def initialize(condition = 'working')
    @condition = condition
  end

  def working?
    true if @condition == 'working'
  end
end
